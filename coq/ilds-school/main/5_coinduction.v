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
Definition lazy_head {A : Type} (d : A) (l : lazy_list A) : A.
Admitted.

(* Define a function that returns the tail of a lazy_list. *)
Definition lazy_tail {A : Type} (l : lazy_list A) : lazy_list A.
Admitted.

(* Define a function that returns the prefix of length [n] of a lazy_list. *)
Definition prefix {A : Type} (d : A) (l : lazy_list A) (n : nat) : list A.
Admitted.

(* Define a function that maps list to lazy_list.
   This should be a [Fixpoint]. *)

Definition list_to_lazy_list {A : Type} (l : list A) : lazy_list A.
Admitted.

(* Prove that the function [list_to_lazy_list] is injective. *)

Lemma list_to_lazy_list_injective (A : Type) (l1 l2 : list A) :
  list_to_lazy_list l1 = list_to_lazy_list l2 -> l1 = l2.
Proof.
Admitted.

(* Define the function that maps [n] to the infinite list of successive natural
   numbers starting from [n]. *)

Definition lazy_from (n : nat) : lazy_list nat.
Admitted.

(* The following does not compute anything because of laziness. *)

Compute (lazy_from 5).

(* The following forces the computation of a prefix.
   You can use this to test your functions. *)

Compute prefix 0 (lazy_from 5) 10.

(* Define the function that ouput the infinite repetition of its input [a]. *)

Definition lazy_repeat {A : Type} (a : A) : lazy_list A.
Admitted.

(* Define the function that output the infinite list of successive applications
   of a function [f] to an initial value [a],
   i.e. [ a, f a, f (f a), f (f (f a)), ... ]. *)

Definition lazy_iterate {A : Type} (f : A -> A) (a : A) : lazy_list A.
Admitted.

(* Define the function that applies a function [f] to each element of a possibly
   infinite list [l]. *)

Definition lazy_map {A B : Type} (f : A -> B) (l : lazy_list A) : lazy_list B.
Admitted.

(* Define a function that concatenates two possibly infinite lists. *)

Definition lazy_append {A : Type} (l1 l2 : lazy_list A) : lazy_list A.
Admitted.

(* Define a function that returns the [n]-th element of a possibly infinite
   list [l]. *)

Definition lazy_nth {A : Type} (n : nat) (l : lazy_list A) : option A.
Admitted.

(* Prove the following trivial (but useful) lemma. *)

Lemma lazy_list_match (A : Type) (l : lazy_list A) :
  l = match l with lazy_nil => lazy_nil | lazy_cons a l' => lazy_cons a l' end.
Proof.
Admitted.

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
Admitted.

(* State and prove the unfolding lemma for [lazy_repeat]. *)

(*
Lemma lazy_repeat_unfold (A : Type) (a : A) :
  lazy_repeat a = ...
*)

(* State and prove the unfolding lemma for [lazy_iterate]. *)

(*
Lemma lazy_iterate_unfold ...
*)

(* Prove the unfolding lemmas for [map]. *)

Lemma lazy_map_nil (A B : Type) (f : A -> B) (l : lazy_list A) :
  lazy_map f lazy_nil = lazy_nil.
Proof.
Admitted.

Lemma lazy_map_cons (A B : Type) (f : A -> B) (a : A) (l : lazy_list A) :
  lazy_map f (lazy_cons a l) = lazy_cons (f a) (lazy_map f l).
Proof.
Admitted.

(* State and prove the unfolding lemmas for [append]. *)

(*
Lemma lazy_append_nil ...

Lemma lazy_append_cons ...
*)

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

Definition omega {A : Type} (l : lazy_list A) : lazy_list A.
Admitted.

(* Prove the following unfolding lemmas for [omega_gen] and [omega]. *)

Lemma omega_nil (A : Type) : omega lazy_nil = lazy_nil (A := A).
Proof.
Admitted.

Lemma omega_gen_nil_r (A : Type) (l : lazy_list A) : omega_gen l lazy_nil = l.
Proof.
Admitted.

Lemma omega_gen_cons_l (A : Type) (a : A) (l1 l2 : lazy_list A) :
  omega_gen (lazy_cons a l1) l2 = lazy_cons a (omega_gen l1 l2).
Proof.
Admitted.

Lemma omega_gen_nil_l (A : Type) (l : lazy_list A) :
  omega_gen lazy_nil l = omega_gen l l.
Proof.
Admitted.

(** * Inductive predicate on a coinductive type *)

(* The [Finite] predicate *)

Inductive Finite {A : Type} : lazy_list A -> Prop :=
| finite_nil : Finite lazy_nil
| finite_cons : forall a l, Finite l -> Finite (lazy_cons a l).

(* Prove the following lemmas (no need for the tactic [cofix]) *)

Lemma Finite_nil (A : Type) : Finite (A := A) lazy_nil.
Proof.
Admitted.

Lemma Finite_1_2_3 : Finite (lazy_cons 1 (lazy_cons 2 (lazy_cons 3 lazy_nil))).
Proof.
Admitted.

Lemma Finite_lazy_cons (A : Type) (a : A) (l : lazy_list A) :
  Finite (lazy_cons a l) -> Finite l.
Proof.
Admitted.

Lemma Finite_lazy_append (A : Type) (l1 l2 : lazy_list A) :
  Finite l1 -> Finite l2 -> Finite (lazy_append l1 l2).
Proof.
Admitted.

(* Hint: You could first prove a more general lemma on omega_gen. *)
Lemma omega_Finite (A : Type) (l : lazy_list A) :
  Finite l -> omega l = lazy_append l (omega l).
Proof.
Admitted.

(** * Coinductive predicate *)

CoInductive Infinite {A : Type} : lazy_list A -> Prop :=
| infinite_cons : forall a l, Infinite l -> Infinite (lazy_cons a l).

(* Quetion: What is the meaning on [Infinite] if one replace the keyword
   [CoInductive] with [Inductive]?                                       *)

(* Prove the following lemmas using the [cofix] tactic
   See the example proof of [sorted_nats] above. *)

Lemma infinite_from (n : nat) : Infinite (lazy_from n).
Proof.
Admitted.

Lemma infinite_repeat (A : Type) (a : A) : Infinite (lazy_repeat a).
Proof.
Admitted.

Lemma infinite_omega_gen (A : Type) (a : A) (l1 l2 : lazy_list A) :
   Infinite (omega_gen l1 (lazy_cons a l2)).
Proof.
Admitted.

Lemma infinite_omega (A : Type) (a : A) (l : lazy_list A) :
  Infinite (omega (lazy_cons a l)).
Proof.
Admitted.

(* Prove the following lemmas using the [inversion] tactic. *)

Lemma not_Infinite_nil (A : Type) : ~Infinite (A := A) lazy_nil.
Proof.
Admitted.

Lemma Infinite_cons_inv (A : Type) (a : A) (l : lazy_list A) :
  Infinite (lazy_cons a l) -> Infinite l.
Proof.
Admitted.

(* Prove the following lemmas using the appropriate tactics. *)

Lemma Infinite_append_l (A : Type) (l1 l2 : lazy_list A) :
  Infinite l1 -> Infinite (lazy_append l1 l2).
Proof.
Admitted.

Lemma Finite_not_Infinite (A : Type) (l : lazy_list A) :
  Finite l -> ~Infinite l.
Proof.
Admitted.

Lemma Infinite_not_Finite (A : Type) (l : lazy_list A) :
  Infinite l -> ~Finite l.
Proof.
Admitted.

Lemma not_Finite_Infinite (A : Type) (l : lazy_list A) :
  ~Finite l -> Infinite l.
Proof.
Admitted.

(* Prove the following lemmas.
   N.B. You need to assume tertium non datur *)

Section Classical.

(* tertium non datur *)
Hypothesis classic : forall (P : Prop), P \/ ~P.

Lemma Not_Infinite_Finite (A : Type) (l : lazy_list A) :
  ~Infinite l -> Finite l.
Proof.
Admitted.

Lemma Finite_or_Infinite (A : Type)(l : lazy_list A) :
  Finite l \/ Infinite l.
Proof.
Admitted.

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

(*
Lemma lazy_equal_reflexive ...

Lemma lazy_equal_symmetric ...

Lemma lazy_equal_transitive ...
*)

(* Prove that Coq equality [eq] is stronger than [lazy_equal]. *)

Lemma eq_lazy_equal (A : Type) (l1 l2 : lazy_list A) :
  l1 = l2 -> lazy_equal l1 l2.
Proof.
Admitted.

(* Prove that in the case of finite lists, both equalities are equivalent. *)

Lemma lazy_equal_eq (A : Type) (l1 l2 : lazy_list A) :
  Finite l1 -> lazy_equal l1 l2 <-> l1 = l2.
Proof.
Admitted.

(* Prove that being [lazy_equal] is equivalent to be pointwise [eq]. *)

Lemma equal_nth (A : Type) (l1 l2 : lazy_list A) :
  lazy_equal l1 l2 <-> forall n, lazy_nth n l1 = lazy_nth n l2.
Proof.
Admitted.

(* Prove that [lazy_equal] preserves [Finite]. *)

Lemma Finite_equal (A : Type) (l1 l2 : lazy_list A) :
  Finite l1 -> lazy_equal l1 l2 -> Finite l2.
Proof.
Admitted.

(* State and prove that [lazy_equal] preserves [Infinite]. *)

(*
Lemma Infinite_equal ...
*)

(* Prove the following equation linking [lazy_iterate] and [lazy_map]. *)

Lemma lazy_map_iterate (A : Type) (f : A -> A) (x : A) :
  lazy_equal (lazy_iterate f (f x)) (lazy_map f (lazy_iterate f x)).
Proof.
Admitted.

(* Prove that [lazy_append] is associative. *)

Lemma lazy_append_assoc (A : Type) (l1 l2 l3 : lazy_list A) :
   lazy_equal
     (lazy_append l1 (lazy_append l2 l3))
     (lazy_append (lazy_append l1 l2) l3).
Proof.
Admitted.

(* Prove that infinite lists are left zero. *)

Lemma lazy_append_infinite (A : Type) (l1 l2 : lazy_list A) :
  Infinite l1 -> lazy_equal l1 (lazy_append l1 l2).
Proof.
Admitted.

(* Prove that [omega l] is a fixpoint of [lazy_append l].
   Compare with omega_Finite. *)

Lemma omega_append (A : Type) (l : lazy_list A) :
  lazy_equal (omega l) (lazy_append l (omega l)).
Proof.
Admitted.
