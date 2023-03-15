(** * Infinite streams *)

Require Import List.

(* Example: the infinite stream of values *)

CoInductive stream (A: Type) :Type :=
| Cons : A -> stream A -> stream A.

Arguments Cons [_] _ _.

(* Example: the stream which infinitely alternates the values true and
   false. *)

CoFixpoint bool_alt : stream bool :=
Cons true (Cons false bool_alt).

(* Examples of pattern matching on coinductive types *)

Definition head {A : Type} (s : stream A) : A :=
match s with Cons a s' => a end.

Definition tail {A : Type} (s : stream A) : stream A :=
match s with Cons a s' => s' end.

(* Examples of corecursive function *)

CoFixpoint repeat {A : Type} (a : A) : stream A :=
Cons a (repeat a).

CoFixpoint iterate {A : Type} (f : A -> A) (a : A) : stream A :=
Cons a (iterate f (f a)).

CoFixpoint map {A B : Type} (f : A -> B) (s : stream A) : stream B :=
match s with Cons a s' => Cons (f a) (map f s') end.

(* Example: the stream of integers starting from [n] *)

CoFixpoint from (n : nat) : stream nat :=
  Cons n (from (S n)).

(* Example: the stream of integers starting from 0 *)

Definition nats : stream nat := from 0.

(* Example: a function which takes the n-th element of an infinite stream *)

Fixpoint nth {A : Type} (n : nat) (s : stream A) {struct n} : A :=
match n with
| 0 => head s
| S n' => nth n' (tail s)
end.

(* Example of coinductive predicate *)

CoInductive sorted : stream nat -> Prop :=
| sorted_intro :
  forall s, head s <= head (tail s) -> sorted (tail s) -> sorted s.

(* Example of proving a coinductive predicate using the tactic [cofix]. *)

Lemma sorted_nats : sorted nats.
Proof.
unfold nats.
generalize 0.
cofix sorted_from.
intro n.
constructor.
- cbn.
  apply le_S, le_n.
- cbn.
  apply sorted_from.
Qed.

(** * Possibly infinite lists *)

(* Aside example : non-standard natural numbers with a greatest element *)

CoInductive Nat : Type :=
| zero : Nat
| successor : Nat -> Nat.

CoFixpoint infinity : Nat :=
  successor infinity.

(* The type of possibly infinite lists *)

CoInductive lazy_list (A : Type) : Type :=
| lazy_nil : lazy_list A
| lazy_cons: A -> lazy_list A -> lazy_list A.

Arguments lazy_nil [_].
Arguments lazy_cons [_] _ _.

Check lazy_cons 1 (lazy_cons 2 (lazy_cons 3 lazy_nil)).

(* In the following exercises you may want to replace the keyword [Definition]
   with either [Fixpoint] or [CoFixpoint], and the final dot by ":=" followed
   by your solution. *)

(* Define a function that returns the head of a lazy_list. *)
Definition lazy_head {A : Type} (d : A) (l : lazy_list A) : A :=
match l with
| lazy_nil => d
| lazy_cons a _ => a
end.

(* Define a function that returns the tail of a lazy_list. *)
Definition lazy_tail {A : Type} (l : lazy_list A) : lazy_list A :=
match l with 
| lazy_nil => lazy_nil
| lazy_cons _ l' => l'
end.

(* Define a function that returns the prefix of length [n] of a lazy_list. *)
Fixpoint prefix {A : Type} (d : A) (l : lazy_list A) (n : nat) : list A :=
match n with
| O => nil
| S n' => lazy_head d l :: prefix d (lazy_tail l) n'
end.

(* Define a function that maps list to lazy_list.
   This should be a [Fixpoint]. *)

Fixpoint list_to_lazy_list {A : Type} (l : list A) : lazy_list A :=
match l with
| nil => lazy_nil
| cons a l' => lazy_cons a (list_to_lazy_list l')
end.

(* Prove that the function [list_to_lazy_list] is injective. *)

Lemma list_to_lazy_list_injective (A : Type) (l1 l2 : list A) :
  list_to_lazy_list l1 = list_to_lazy_list l2 -> l1 = l2.
Proof.
revert l2.
induction l1 as [ | a1 l1' IH ].
- cbn.
  intros [ | a2 l2' ].
  + reflexivity.
  + cbn.
    intro Heq.
    discriminate Heq.
- cbn.
  intros [ | a2 l2' ].
  + cbn.
    intro Heq.
    discriminate Heq.
  + cbn.
    intros [= Hhead Htail].
    f_equal.
    * exact Hhead.
    * apply IH.
      exact Htail.
Qed.

(* Define the function that maps [n] to the infinite list of successive natural
   numbers starting from [n]. *)

CoFixpoint lazy_from (n : nat) : lazy_list nat :=
  lazy_cons n (lazy_from (S n)).

(* The following does not compute anything because of laziness. *)

Compute (lazy_from 5).

(* The following forces the computation of a prefix.
   You can use this to test your functions. *)

Compute prefix 0 (lazy_from 5) 10.

(* Define the function that ouput the infinite repetition of its input [a]. *)

CoFixpoint lazy_repeat {A : Type} (a : A) : lazy_list A :=
lazy_cons a (lazy_repeat a).

(* Define the function that output the infinite list of successive applications
   of a function [f] to an initial value [a],
   i.e. [ a, f a, f (f a), f (f (f a)), ... ]. *)

CoFixpoint lazy_iterate {A : Type} (f : A -> A) (a : A) : lazy_list A :=
lazy_cons a (lazy_iterate f (f a)).

(* Define the function that applies a function [f] to each element of a possibly
   infinite list [l]. *)

CoFixpoint lazy_map {A B : Type} (f : A -> B) (l : lazy_list A) : lazy_list B :=
match l with
| lazy_nil => lazy_nil
| lazy_cons a l' => lazy_cons (f a) (lazy_map f l')
end.

(* Define a function that concatenates two possibly infinite lists. *)

CoFixpoint lazy_append {A : Type} (l1 l2 : lazy_list A) : lazy_list A :=
match l1 with
| lazy_nil => l2
| lazy_cons a l1' => lazy_cons a (lazy_append l1' l2)
end.

(* Define a function that returns the [n]-th element of a possibly infinite
   list [l]. *)

Fixpoint lazy_nth {A : Type} (n : nat) (l : lazy_list A) {struct n} :
  option A := match l with
| lazy_nil => None
| lazy_cons a l' => match n with
  | O => Some a
  | S n' => lazy_nth n' l'
  end
end.

(* Prove the following trivial (but useful) lemma. *)

Lemma lazy_list_match (A : Type) (l : lazy_list A) :
  l = match l with lazy_nil => lazy_nil | lazy_cons a l' => lazy_cons a l' end.
Proof.
destruct l; reflexivity.
Qed.

(* The following unfolding lemmas will be useful later. *)

(* Prove the unfolding lemma for [lazy_from]. *)

Lemma lazy_from_unfold (n : nat) : lazy_from n = lazy_cons n (lazy_from (S n)).
Proof.
(* The tactics [cbn] or [simpl] are not doing anything here because
   a corecursive function can only be reduced when in-between [match]
   and [with]. Therefore you must use the lemma [lazy_list_match] beforehand. *)
etransitivity.
{
  apply lazy_list_match.
}
cbn.
reflexivity.
Qed.

(* State and prove the unfolding lemma for [lazy_repeat]. *)

Lemma lazy_repeat_unfold (A : Type) (a : A) :
  lazy_repeat a = lazy_cons a (lazy_repeat a).
Proof.
etransitivity.
{
  apply lazy_list_match.
}
cbn.
reflexivity.
Qed.

(* State and prove the unfolding lemma for [lazy_iterate]. *)

Lemma lazy_iterate_unfold {A : Type} (f : A -> A) (a : A) :
  lazy_iterate f a = lazy_cons a (lazy_iterate f (f a)).
Proof.
etransitivity.
{
  apply lazy_list_match.
}
cbn.
reflexivity.
Qed.

(* Prove the unfolding lemmas for [map]. *)

Lemma lazy_map_nil (A B : Type) (f : A -> B) (l : lazy_list A) :
  lazy_map f lazy_nil = lazy_nil.
Proof.
etransitivity.
{
  apply lazy_list_match.
}
cbn.
reflexivity.
Qed.

Lemma lazy_map_cons (A B : Type) (f : A -> B) (a : A) (l : lazy_list A) :
  lazy_map f (lazy_cons a l) = lazy_cons (f a) (lazy_map f l).
Proof.
etransitivity.
{
  apply lazy_list_match.
}
cbn.
reflexivity.
Qed.

(* State and prove the unfolding lemmas for [append]. *)

Lemma lazy_append_nil (A : Type) (v : lazy_list A) :
   lazy_append lazy_nil v = v.
Proof.
etransitivity.
{
  apply lazy_list_match.
}
cbn.
destruct v; reflexivity.
Qed.

Lemma lazy_append_cons (A : Type) (a : A) (l1 l2 : lazy_list A) :
  lazy_append (lazy_cons a l1) l2 = lazy_cons a (lazy_append l1 l2).
Proof.
etransitivity.
{
  apply lazy_list_match.
}
cbn.
reflexivity.
Qed.

(* The following is the function [omega_gen] such that [omega_gen l1 l2] is the
   concatenation of [l1] followed by the infinite repetition of [l2]. *)

CoFixpoint omega_gen {A : Type} (l1 l2 : lazy_list A) : lazy_list A :=
match l2 with
| lazy_nil => l1
| lazy_cons a2 l2' =>
  match l1 with
  | lazy_nil => lazy_cons a2 (omega_gen l2' l2)
  | lazy_cons a1 l1' => lazy_cons a1 (omega_gen l1' l2)
  end
end.

(* Define the function [omega] such that [omega l] is the infinite repetition
   of [l]. *)

Definition omega {A : Type} (l : lazy_list A) : lazy_list A :=
omega_gen l l.

(* Prove the following unfolding lemmas for [omega_gen] and [omega]. *)

Lemma omega_nil (A : Type) : omega lazy_nil = lazy_nil (A := A).
Proof.
etransitivity.
{
  apply lazy_list_match.
}
cbn.
reflexivity.
Qed.

Lemma omega_gen_nil_r (A : Type) (l : lazy_list A) : omega_gen l lazy_nil = l.
Proof.
etransitivity.
{
  apply lazy_list_match.
}
cbn.
destruct l; reflexivity.
Qed.

Lemma omega_gen_cons_l (A : Type) (a : A) (l1 l2 : lazy_list A) :
  omega_gen (lazy_cons a l1) l2 = lazy_cons a (omega_gen l1 l2).
Proof.
etransitivity.
{
  apply lazy_list_match.
}
cbn.
destruct l2 as [ | a2 l2 ].
- f_equal.
  rewrite omega_gen_nil_r.
  reflexivity.
- reflexivity.
Qed.

Lemma omega_gen_nil_l (A : Type) (l : lazy_list A) :
  omega_gen lazy_nil l = omega_gen l l.
Proof.
etransitivity.
{
  apply lazy_list_match.
}
cbn.
destruct l as [ | a l ].
- change (omega_gen lazy_nil lazy_nil) with (omega (A := A) lazy_nil).
  rewrite omega_nil.
  reflexivity.
- rewrite omega_gen_cons_l.
  reflexivity.
Qed.

(** * Inductive predicate on a coinductive type *)

(* The [Finite] predicate *)

Inductive Finite {A : Type} : lazy_list A -> Prop :=
| finite_nil : Finite lazy_nil
| finite_cons : forall a l, Finite l -> Finite (lazy_cons a l).

(* Prove the following lemmas (no need for the tactic [cofix]) *)

Lemma Finite_nil (A : Type) : Finite (A := A) lazy_nil.
Proof.
constructor.
Qed.

Lemma Finite_1_2_3 : Finite (lazy_cons 1 (lazy_cons 2 (lazy_cons 3 lazy_nil))).
Proof.
repeat constructor.
Qed.

Lemma Finite_lazy_cons (A : Type) (a : A) (l : lazy_list A) :
  Finite (lazy_cons a l) -> Finite l.
Proof.
intro Hfin.
inversion Hfin.
assumption.
Qed.

Lemma Finite_lazy_append (A : Type) (l1 l2 : lazy_list A) :
  Finite l1 -> Finite l2 -> Finite (lazy_append l1 l2).
Proof.
induction 1 as [ | a l1 Hfin1 IH ].
- rewrite lazy_append_nil.
  trivial.
- intro Hfin2.
  rewrite lazy_append_cons.
  constructor.
  apply IH.
  exact Hfin2.
Qed.

(* Hint: You could first prove a more general lemma on omega_gen. *)
Lemma omega_Finite (A : Type) (l : lazy_list A) :
  Finite l -> omega l = lazy_append l (omega l).
Proof.
unfold omega.
intro Hfin.
generalize l at 2 4 5.
induction Hfin as [ | a l Hfin IH ]; intro l'.
- rewrite lazy_append_nil.
  apply omega_gen_nil_l.
- rewrite lazy_append_cons.
  rewrite omega_gen_cons_l.
  f_equal.
  apply IH.
Qed.

(** * Coinductive predicate *)

CoInductive Infinite {A : Type} : lazy_list A -> Prop :=
| infinite_cons : forall a l, Infinite l -> Infinite (lazy_cons a l).

(* Quetion: What is the meaning on [Infinite] if one replace the keyword
   [CoInductive] with [Inductive]? *)
(* Answer: This is the constant predicate always false. *)

(* Prove the following lemmas using the [cofix] tactic
   See the example proof of [sorted_nats] above. *)

Lemma infinite_from (n : nat) : Infinite (lazy_from n).
Proof.
revert n.
cofix infinite_from.
intro n.
rewrite lazy_from_unfold.
constructor.
apply infinite_from.
Qed.

Lemma infinite_repeat (A : Type) (a : A) : Infinite (lazy_repeat a).
Proof.
revert a.
cofix infinite_repeat.
intro a.
rewrite lazy_repeat_unfold.
constructor.
apply infinite_repeat.
Qed.

Lemma infinite_omega_gen (A : Type) (a : A) (l1 l2 : lazy_list A) :
   Infinite (omega_gen l1 (lazy_cons a l2)).
Proof.
revert l1.
cofix infinite_omega_gen.
intros [ | a1 l1].
- rewrite omega_gen_nil_l.
  rewrite omega_gen_cons_l.
  constructor.
  apply infinite_omega_gen.
- rewrite omega_gen_cons_l.
  constructor.
  apply infinite_omega_gen.
Qed.

Corollary infinite_omega (A : Type) (a : A) (l : lazy_list A) :
  Infinite (omega (lazy_cons a l)).
Proof.
revert a l.
cofix infinite_omega.
intros a l.
unfold omega.
rewrite omega_gen_cons_l.
constructor.
apply infinite_omega_gen.
Qed.

(* Prove the following lemmas using the [inversion] tactic. *)

Lemma not_Infinite_nil (A : Type) : ~Infinite (A := A) lazy_nil.
Proof.
intro Hinf.
inversion Hinf.
Qed.

Lemma Infinite_cons_inv (A : Type) (a : A) (l : lazy_list A) :
  Infinite (lazy_cons a l) -> Infinite l.
Proof.
intro Hinf.
inversion Hinf.
assumption.
Qed.

(* Prove the following lemmas using the appropriate tactics. *)

Lemma Infinite_append_l (A : Type) (l1 l2 : lazy_list A) :
  Infinite l1 -> Infinite (lazy_append l1 l2).
Proof.
revert l1.
cofix Infinite_append_l.
intros l1 Hinf.
inversion Hinf.
rewrite lazy_append_cons.
constructor.
apply Infinite_append_l.
assumption.
Qed.

Lemma Finite_not_Infinite (A : Type) (l : lazy_list A) :
  Finite l -> ~Infinite l.
Proof.
intro Hfin.
induction Hfin as [ | a l Hfin Hnotinf].
- intro Hinf.
  inversion Hinf.
- intro Hinf.
  inversion Hinf.
  contradiction.
Qed.

Lemma Infinite_not_Finite (A : Type) (l : lazy_list A) :
  Infinite l -> ~Finite l.
Proof.
intros Hinf Hfin.
induction Hfin as [ | a l Hfin Hnotinf].
- apply not_Infinite_nil in Hinf.
  trivial.
- apply Infinite_cons_inv in Hinf.
  tauto.
Qed.

Lemma not_Finite_Infinite (A : Type) (l : lazy_list A) :
  ~Finite l -> Infinite l.
Proof.
revert l.
cofix not_Finite_Infinite.
intros [ | a l'] Hnot_fin.
- contradict Hnot_fin.
  constructor 1.
- constructor.
  apply not_Finite_Infinite.
  contradict Hnot_fin.
  constructor 2.
  exact Hnot_fin.
Qed.

(* Prove the following lemmas.
   N.B. You need to assume tertium non datur *)

Section Classical.

(* tertium non datur *)
Hypothesis classic : forall (P : Prop), P \/ ~P.

Lemma NNPP (P : Prop) : ~~P -> P.
Proof.
specialize (classic P).
tauto.
Qed.

Lemma Not_Infinite_Finite (A : Type) (l : lazy_list A) :
  ~Infinite l -> Finite l.
Proof.
intro Hnotinf.
apply NNPP.
contradict Hnotinf.
revert l Hnotinf.
cofix Not_Infinite_Finite.
intros [ | a l ]; intro Hnotfin.
- contradict Hnotfin.
  apply Finite_nil.
- constructor.
  apply Not_Infinite_Finite.
  contradict Hnotfin.
  constructor.
  exact Hnotfin.
Qed.

Lemma Finite_or_Infinite (A : Type)(l : lazy_list A) :
  Finite l \/ Infinite l.
Proof.
generalize (classic (Finite l)).
intros [ Hfin | Hnotfin ].
- tauto.
- right.
  apply not_Finite_Infinite.
  exact Hnotfin.
Qed.

End Classical.

(** * Weakening equality *)

(* The equality of Coq is too strong. We define a weaker notion of equality. *)

CoInductive lazy_equal {A : Type} : lazy_list A -> lazy_list A -> Prop :=
| equal_nil : lazy_equal lazy_nil lazy_nil
| equal_cons : forall (a1 a2 : A) (l1 l2 : lazy_list A),
    a1 = a2 -> lazy_equal l1 l2 ->
    lazy_equal (lazy_cons a1 l1) (lazy_cons a2 l2).

(* State and prove that [lazy_equal] is an equivalence relation, i.e. it is
   reflexive, symmetric and transitive. *)

Lemma lazy_equal_reflexive (A : Type) (l : lazy_list A) : lazy_equal l l.
Proof.
revert l.
cofix lazy_equal_reflexive.
intros [ | a l ]; constructor.
- reflexivity.
- apply lazy_equal_reflexive.
Qed.

Lemma lazy_equal_symmetric (A : Type) (l1 l2 : lazy_list A) :
  lazy_equal l1 l2 -> lazy_equal l2 l1.
Proof.
revert l1 l2.
cofix lazy_equal_symmetric.
intros l1 l2 [ | a1 a2 l1' l2' Hhead Htail]; constructor.
- symmetry.
  exact Hhead.
- apply lazy_equal_symmetric.
  exact Htail.
Qed.

Lemma lazy_equal_transitive (A : Type) (l1 l2 l3 : lazy_list A) :
  lazy_equal l1 l2 -> lazy_equal l2 l3 -> lazy_equal l1 l3.
Proof.
revert l1 l2 l3.
cofix lazy_equal_transitive.
intros l1 l2 l3 Heq12 Heq23.
destruct Heq12 as [ | a1 a2 l1' l2' Hhead12 Htail12]; [ exact Heq23 | ].
inversion Heq23.
constructor.
- transitivity a2; assumption.
- apply lazy_equal_transitive with l2'; assumption.
Qed.

(* Prove that Coq equality [eq] is stronger than [lazy_equal]. *)

Lemma eq_lazy_equal (A : Type) (l1 l2 : lazy_list A) :
  l1 = l2 -> lazy_equal l1 l2.
Proof.
intro Heq.
rewrite Heq.
apply lazy_equal_reflexive.
Qed.

(* Prove that in the case of finite lists, both equalities are equivalent. *)

Lemma lazy_equal_eq (A : Type) (l1 l2 : lazy_list A) :
  Finite l1 -> lazy_equal l1 l2 <-> l1 = l2.
Proof.
intro Hfin.
split.
- revert l2.
  induction Hfin as [ | a l Hfin IH]; intros l2 Hequal.
  + inversion Hequal.
   reflexivity.
  + inversion Hequal.
    f_equal.
    * assumption.
    * apply IH.
      assumption.
- apply eq_lazy_equal.
Qed.

(* Prove that being [lazy_equal] is equivalent to be pointwise [eq]. *)

Lemma equal_nth (A : Type) (l1 l2 : lazy_list A) :
  lazy_equal l1 l2 <-> forall n, lazy_nth n l1 = lazy_nth n l2.
Proof.
split.
- intros Hequal n.
  revert l1 l2 Hequal.
  induction n as [ | n' IH ]; intros [ | a1 l1] [ | a2 l2] Hequal; cbn;
   try reflexivity; try now inversion Hequal.
  + inversion Hequal; congruence.
  + apply IH.
    inversion Hequal; assumption.
- revert l1 l2.
  cofix nth_equal.
  intros [ | a1 l1 ] [ | a2 l2 ] Heq.
  + apply lazy_equal_reflexive.
  + specialize (Heq O).
    cbn in Heq.
    discriminate Heq.
  + specialize (Heq O).
    cbn in Heq.
    discriminate Heq.
  + generalize (Heq O).
    cbn.
    intro Heq_head.
    constructor.
    * injection Heq_head; trivial.
    * apply nth_equal.
      intro n.
      exact (Heq (S n)).
Qed.

(* Prove that [lazy_equal] preserves [Finite]. *)

Lemma Finite_equal (A : Type) (l1 l2 : lazy_list A) :
  Finite l1 -> lazy_equal l1 l2 -> Finite l2.
Proof.
intro Hfin.
revert l2.
induction Hfin as [ | a l Hfin IH ]; intros l2 Hequal.
- inversion Hequal.
  apply Finite_nil.
- inversion Hequal.
  constructor.
  apply IH.
  assumption.
Qed.

(* State and prove that [lazy_equal] preserves [Infinite]. *)

Lemma Infinite_equal (A : Type) (l1 l2 : lazy_list A) :
  Infinite l1 -> lazy_equal l1 l2 -> Infinite l2.
Proof.
revert l1 l2.
cofix Infinite_equal.
intros l1 l2 Hinf Hequal.
inversion Hequal.
- congruence.
- constructor.
  eapply Infinite_equal; [ | eassumption ].
  subst.
  inversion Hinf.
  assumption.
Qed.

(* Prove the following equation linking [lazy_iterate] and [lazy_map]. *)

Lemma lazy_map_iterate (A : Type) (f : A -> A) (x : A) :
  lazy_equal (lazy_iterate f (f x)) (lazy_map f (lazy_iterate f x)).
Proof.
revert x.
cofix lazy_map_iterate.
intro x.
rewrite lazy_iterate_unfold, (lazy_iterate_unfold _ x), lazy_map_cons.
constructor.
- reflexivity.
- apply lazy_map_iterate.
Qed.

(* Prove that [lazy_append] is associative. *)

Lemma lazy_append_assoc (A : Type) (l1 l2 l3 : lazy_list A) :
   lazy_equal
     (lazy_append l1 (lazy_append l2 l3))
     (lazy_append (lazy_append l1 l2) l3).
Proof.
revert l1.
cofix lazy_append_assoc.
intros [ | a1 l1 ].
- do 2 rewrite lazy_append_nil.
  apply lazy_equal_reflexive.
- do 3 rewrite lazy_append_cons.
  constructor.
  + reflexivity.
  + apply lazy_append_assoc.
Qed.

(* Prove that infinite lists are left zero. *)

Lemma lazy_append_infinite (A : Type) (l1 l2 : lazy_list A) :
  Infinite l1 -> lazy_equal l1 (lazy_append l1 l2).
Proof.
revert l1.
cofix lazy_append_infinite; intros [ | a1 l1 ] Hinf.
- inversion Hinf.
- rewrite lazy_append_cons.
  constructor.
  + reflexivity.
  + apply lazy_append_infinite.
    inversion Hinf.
    assumption.
Qed.

(* Prove that [omega l] is a fixpoint of [lazy_append l].
   Compare with omega_Finite. *)

Lemma omega_append (A : Type) (l : lazy_list A) :
  lazy_equal (omega l) (lazy_append l (omega l)).
Proof.
unfold omega.
generalize l at 1 3.
cofix omega_append.
intros [ | a l1' ].
- rewrite lazy_append_nil, omega_gen_nil_l.
  apply lazy_equal_reflexive.
- rewrite lazy_append_cons, omega_gen_cons_l.
  constructor.
  + reflexivity.
  + apply omega_append.
Qed.
