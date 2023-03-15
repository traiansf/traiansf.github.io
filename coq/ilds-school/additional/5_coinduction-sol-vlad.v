(** * Infinite streams *)

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

(* Example: the stream of integers starting from 0. *)

CoFixpoint from (n : nat) : stream nat :=
  Cons n (from (S n)).

Definition nats : stream nat := from 0.

(* define a function which takes the n-th element of an infinite stream. *)

Fixpoint nth {A : Type} (n : nat) (s : stream A) : A :=
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

(* Define a function that maps list to lazy_list. *)

Fixpoint list_to_lazy_list {A : Type} (l : list A) : lazy_list A :=
  match l with
  | nil => lazy_nil
  | cons a l' => lazy_cons a (list_to_lazy_list l')
  end.                          

Compute list_to_lazy_list (cons 1 (cons 2 nil)).


(* Prove that the function [list_to_lazy_list] is injective. *)

Lemma list_to_lazy_list_injective (A : Type) (l1 l2 : list A) :
  list_to_lazy_list l1 = list_to_lazy_list l2 -> l1 = l2.
Proof.
  revert l1 l2.
  induction l1.
  * intros l2 Heq.
    destruct l2 ; try reflexivity.
    cbn in Heq.
    discriminate Heq.
 * intros l2 Heq.
   destruct l2.
  + discriminate Heq.
  +  injection Heq ; intros Hinj1 Hinj2  ; subst.
     rewrite IHl1 with l2; try reflexivity.
     assumption.
Qed.
     (* Define the function that maps [n] to the infinite list of successive natural
   numbers starting from [n]. *)

CoFixpoint lazy_from (n : nat) : lazy_list nat := lazy_cons n (lazy_from (S n)).


(* Define the function that ouput the infinite repetition of its input [a]. *)

CoFixpoint lazy_repeat {A : Type} (a : A) : lazy_list A := lazy_cons a (lazy_repeat a).

(* Define the function that output the infinite list of successive applications
   of a function [f] to an initial value [a],
   i.e. [ a, f a, f (f a), f (f (f a)), ... ]. *)

CoFixpoint lazy_iterate {A : Type} (f : A -> A) (a : A) : lazy_list A := lazy_cons a (lazy_iterate f (f  a)).


(* Define the function that applies a function [f] to each element of a possibly
   infinite list [l]. *)

CoFixpoint lazy_map {A B : Type} (f : A -> B) (l : lazy_list A) : lazy_list B :=
  match l with
   |  lazy_nil => lazy_nil
   | lazy_cons a l' => lazy_cons (f a) (lazy_map f l')                  
   end.

(* Define a function that concatenates two possibly infinite lists. *)

CoFixpoint lazy_append {A : Type} (l1 l2 : lazy_list A) : lazy_list A :=
 match l1 with
   |  lazy_nil => l2
   | lazy_cons a l' => lazy_cons a (lazy_append  l' l2)                  
   end.
 

(* Define a function that returns the [n]-th element of a possibly infinite
   list [l]. *)

Fixpoint lazy_nth {A : Type} (n : nat) (l : lazy_list A) : option A :=
  match n,l with
    | 0, (lazy_cons a l') => Some a
    | S n',  (lazy_cons a l') => lazy_nth n' l'
    | _, _ => None
   end.          
(* Prove the following trivial (but useful) lemma. *)

Lemma lazy_list_match (A : Type) (l : lazy_list A) :
  l = match l with lazy_nil => lazy_nil | lazy_cons a l' => lazy_cons a l' end.
Proof.
  destruct l ; reflexivity.
Qed.
(* Prove the unfolding lemma for [lazy_from] *)

Lemma lazy_from_unfold (n : nat) : lazy_from n = lazy_cons n (lazy_from (S n)).
Proof.
  replace ( lazy_from n) with ( match (lazy_from n) with lazy_nil => lazy_nil | lazy_cons a l' => lazy_cons a l'  end) ; try (rewrite lazy_list_match; reflexivity).
  cbn;reflexivity.
 Qed. 
(* The tactics [cbn] or [simpl] are not doing anything here because
   a corecursive function can only be reduced when in-between [match]
   and [with]. Therefore you must use the lemma [lazy_list_match] beforehand. *)


(* State and prove the unfolding lemma for [lazy_repeat]. *)


Lemma lazy_repeat_unfold (A : Type) (a : A) :
  lazy_repeat a = lazy_cons a (lazy_repeat a).
Proof.
  etransitivity.
  * apply lazy_list_match.
  *  cbn ; reflexivity.
Qed.
     (* State and prove the unfolding lemma for [lazy_iterate]. *)


Lemma lazy_iterate_unfold{A : Type} (f : A -> A) (a : A)  :  lazy_iterate f  a = lazy_cons a (lazy_iterate f  (f a)).
 etransitivity.
  * apply lazy_list_match.
  *  cbn ; reflexivity.
Qed.

(* Prove the unfolding lemmas for [map]. *)

Lemma lazy_map_nil (A B : Type) (f : A -> B) (l : lazy_list A) :
  lazy_map f lazy_nil = lazy_nil.
Proof.
  etransitivity.
  * apply lazy_list_match.
  *  cbn ; reflexivity.
Qed.

Lemma lazy_map_cons (A B : Type) (f : A -> B) (a : A) (l : lazy_list A) :
  lazy_map f (lazy_cons a l) = lazy_cons (f a) (lazy_map f l).
Proof.
  etransitivity.
  * apply lazy_list_match.
  *  cbn ; reflexivity.
Qed.

(* State and prove the unfolding lemmas for [append]. *)


Lemma lazy_append_nil{A:Type}(l: lazy_list A)  : lazy_append lazy_nil l = l.
Proof.
  etransitivity.
  * apply lazy_list_match.
  *  cbn.  rewrite <- lazy_list_match;
     reflexivity.
Qed.

Lemma lazy_append_cons {A:Type}(a:A)(l' l: lazy_list A)  :
  lazy_append (lazy_cons a l')  l =  lazy_cons a (lazy_append l' l).
 Proof. 
etransitivity.
  * apply lazy_list_match.
  *  cbn;
     reflexivity.
Qed.

(* Define the function [omega_gen] such that [omega_gen l1 l2] is the
   concatenation of [l1] followed by the infinite repetition of [l2]. *)

 CoFixpoint omega_gen {A : Type} (l1 l2 : lazy_list A) : lazy_list A :=
   match l2 with
   |lazy_nil => l1
   |lazy_cons a l' =>
    match l1 with
      | lazy_nil => lazy_cons a (omega_gen l' l2)
      | lazy_cons b l'' =>  lazy_cons b (omega_gen l'' l2)
     end                                 
end.

(* Define the function [omega] such that [omega l] is the infinite repetition
   of [l]. *)

Definition omega {A : Type} (l : lazy_list A) : lazy_list A := omega_gen l l.


(* Prove the following unfolding lemmas for [omega_gen] and [omega]. *)

Lemma omega_nil (A : Type) : omega lazy_nil = lazy_nil (A := A).
Proof.
etransitivity.
  * apply lazy_list_match.
  *  cbn;
     reflexivity.
Qed.

Lemma omega_gen_nil_r (A : Type) (l : lazy_list A) : omega_gen l lazy_nil = l.
Proof.
etransitivity.
  * apply lazy_list_match.
  *  cbn. rewrite <- lazy_list_match;
     reflexivity.
Qed.

Lemma omega_gen_cons_l (A : Type) (a : A) (l1 l2 : lazy_list A) :
  omega_gen (lazy_cons a l1) l2 = lazy_cons a (omega_gen l1 l2).
Proof.
etransitivity.
  * apply lazy_list_match.
  *  cbn.
     destruct l2.
     + rewrite omega_gen_nil_r ; reflexivity.
     +  reflexivity.
Qed.

Lemma omega_gen_nil_l (A : Type) (l : lazy_list A) :
  omega_gen lazy_nil l = omega_gen l l.
Proof.
etransitivity.
  * apply lazy_list_match.
  *  cbn.
     destruct l.
  + replace  ( omega_gen lazy_nil lazy_nil) with (omega lazy_nil (A := A)).
   - rewrite omega_nil ; reflexivity.
   - reflexivity.
 + rewrite  omega_gen_cons_l ; reflexivity.
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
  intros Hfin.
  inversion Hfin ; assumption.
Qed.

Lemma Finite_lazy_append (A : Type) (l1 l2 : lazy_list A) :
  Finite l1 -> Finite l2 -> Finite (lazy_append l1 l2).
Proof.
 intros Hfin1 Hfin2.
induction Hfin1.
* rewrite lazy_append_nil ; assumption.
*rewrite lazy_append_cons.
 constructor ; assumption.
Qed.


  
Lemma omega_gen_omega(A : Type) (l1 l2 : lazy_list A) :
    Finite l1 -> omega_gen l1 l2 = lazy_append l1 (omega l2).
Proof.
  intros Hfin1.
  revert l2.  
unfold omega.
induction Hfin1; intros.
*rewrite lazy_append_nil.
 rewrite <- omega_gen_nil_l ; try assumption.
 reflexivity.
* rewrite lazy_append_cons.
  rewrite <- IHHfin1 ; try assumption.
  rewrite omega_gen_cons_l ; reflexivity.
Qed.
  
Lemma omega_Finite (A : Type) (l : lazy_list A) :
  Finite l -> omega l = lazy_append l (omega l).
Proof.
intros.
rewrite  <- omega_gen_omega ; try assumption.
reflexivity.
Qed.


(** * Coinductive predicate *)

CoInductive Infinite {A : Type} : lazy_list A -> Prop :=
| infinite_cons : forall a l, Infinite l -> Infinite (lazy_cons a l).

(* Quetion: What is the meaning on [Infinite] if one replace the keyword
   [CoInductive] with [Inductive]?                                       *)

(* Prove the following lemmas using the [cofix] tactic
   See the example proof of [sorted_nats] above. *)

(* Vlad: I would suggest here to use unfold lemmas, or to transform goal so that it applies to "something bigger", dual to induction *)

Lemma infinite_from (n : nat) : Infinite (lazy_from n).
Proof.
  revert n.
  cofix Hinf ; intros.
  rewrite lazy_from_unfold.
  constructor.
  apply Hinf.    
Qed.

Lemma infinite_repeat (A : Type) (a : A) : Infinite (lazy_repeat a).
Proof.
revert a.
cofix Hinf ; intros.
rewrite lazy_repeat_unfold.
constructor.
apply Hinf.
Qed.

Lemma infinite_omega_gen (A : Type) (a : A) (l1 l2 : lazy_list A) :
   Infinite (omega_gen l1 (lazy_cons a l2)).
Proof.
revert a l1 l2.
cofix Hinf ; intros.
destruct l1.
* rewrite omega_gen_nil_l.
  rewrite omega_gen_cons_l.
  constructor.
  apply Hinf.
* rewrite omega_gen_cons_l.
  constructor.
  apply Hinf.  
Qed.

Lemma infinite_omega (A : Type) (a : A) (l : lazy_list A) :
  Infinite (omega (lazy_cons a l)).
Proof.
apply infinite_omega_gen.
Qed.

(* Prove the following lemmas using the [inversion] tactic. *)

Lemma not_Infinite_nil (A : Type) : ~Infinite (A := A) lazy_nil.
Proof.
  intro Hinv.
  inversion Hinv.  
Qed.

Lemma Infinite_cons_inv (A : Type) (a : A) (l : lazy_list A) :
  Infinite (lazy_cons a l) -> Infinite l.
Proof.
  intro Hinv; inversion Hinv ; auto.
Qed.

(* Prove the following lemmas using the appropriate tactics. *)

Lemma Infinite_append_l (A : Type) (l1 l2 : lazy_list A) :
  Infinite l1 -> Infinite (lazy_append l1 l2).
Proof.
 revert l1. 
 cofix Hcof ; intros.
 destruct l1.
* destruct (not_Infinite_nil _ H). 
* rewrite lazy_append_cons.
   constructor.
   apply Hcof.
   eapply Infinite_cons_inv ; eauto.
Qed.


Lemma Finite_not_Infinite (A : Type) (l : lazy_list A) :
  Finite l -> ~Infinite l.
Proof.
  intros Hfinite.
  induction Hfinite.
  * apply not_Infinite_nil.
  *   intro Hinfcons.
      apply IHHfinite.
      eapply Infinite_cons_inv; eauto.
Qed.

Lemma Infinite_not_Finite (A : Type) (l : lazy_list A) :
  Infinite l -> ~Finite l.
Proof.
intros Hinf  Hfin.  
induction Hfin.
* destruct (not_Infinite_nil _ Hinf).
*  apply IHHfin.
   eapply Infinite_cons_inv; eauto.
 Qed.  

Lemma not_Finite_Infinite (A : Type) (l : lazy_list A) :
  ~Finite l -> Infinite l.
Proof.
  revert l.
  cofix Hcof; intros.
  destruct l.
  * destruct (H (Finite_nil _ )).
  * Guarded.
    constructor.    
    apply Hcof.
    Guarded.
    intro Hfin ; apply H.
    constructor; assumption.
Qed.  


(* Prove the following lemmas.
   N.B. You need to assume tertium non datur *)

Section Classical.

(* tertium non datur *)
  Hypothesis classic : forall (P : Prop), P \/ ~P.

 Lemma nnpp: forall P, ~~P -> P. 
Proof.
    intros.
   destruct (classic P); try assumption.
   destruct (H H0).
 Qed.
 
   Lemma Not_Infinite_Finite (A : Type) (l : lazy_list A) :
  ~Infinite l -> Finite l.
   Proof.
    intro Hinf.
    destruct (classic  (~(Finite  l))).
    * destruct (Hinf (not_Finite_Infinite _ _ H)).
    * apply nnpp; assumption.
Qed.

Lemma Finite_or_Infinite (A : Type)(l : lazy_list A) :
  Finite l \/ Infinite l.
Proof.
  destruct (classic (Infinite l)).
  * right; assumption.
  *  left; apply Not_Infinite_Finite;assumption.
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


Lemma lazy_equal_reflexive(A : Type)(l : lazy_list A) : lazy_equal l l.
Proof.
  revert l.
  cofix Hcof ; intros.
  destruct l.
  * constructor.
  * constructor; try reflexivity.
    apply Hcof.    
Qed.

Lemma lazy_equal_symmetric(A : Type)(l1 l2 : lazy_list A) : lazy_equal l1 l2 -> lazy_equal l2 l1.
Proof.
revert l1 l2.  
cofix Hcof ; intros.
destruct l1 ; destruct l2.
* constructor.
*  inversion H.
*  inversion H.
* inversion H; subst.
  constructor 2 ; try reflexivity.
  apply Hcof; auto.
Qed.

Lemma lazy_equal_transitive (A : Type)(l1 l2 l3: lazy_list A) :
  lazy_equal l1 l2 -> lazy_equal l2 l3 -> lazy_equal l1 l3.
Proof.
  revert l1 l2 l3.
  cofix Hcof ;intros.
  destruct l1 ; destruct l2 ; destruct l3 ; try (inversion H0 ; subst); try (inversion H ; subst).
 * constructor.
 * constructor; try reflexivity.
   eapply Hcof; eassumption.
Qed.


(* Prove that Coq equality [eq] is stronger than [lazy_equal]. *)

Lemma eq_lazy_equal (A : Type) (l1 l2 : lazy_list A) :
  l1 = l2 -> lazy_equal l1 l2.
Proof.
  revert l1 l2.
  cofix Hcof ; intros; subst.
  destruct l2.
  * constructor.
  *  constructor 2; try reflexivity.
     apply Hcof; reflexivity.
Qed.     

(* Prove that in the case of finite lists, both equalities are equivalent. *)

Lemma lazy_equal_eq (A : Type) (l1 l2 : lazy_list A) :
  Finite l1 -> lazy_equal l1 l2 <-> l1 = l2.
Proof.
  split.
  * revert l2.
    induction H ; intros l2 Heq.
     + inversion Heq  ; subst; reflexivity.
     +  inversion Heq  ; subst.
        rewrite IHFinite with l0 ; try reflexivity.
        assumption.
  * intros ; subst. 
    apply  lazy_equal_reflexive.
Qed.     

(* Prove that being [lazy_equal] is equivalent to be pointwise [eq]. *)

Lemma equal_nth (A : Type) (l1 l2 : lazy_list A) :
  lazy_equal l1 l2 <-> forall n, lazy_nth n l1 = lazy_nth n l2.
Proof.
split.
* intros Heq n.
  revert Heq.
  revert l1 l2.
  revert n.
  induction n.
  +  intros l1 l2 Heq. 
     inversion Heq ; subst; reflexivity.
  +  intros l1 l2 Heq.
      inversion Heq ; subst ; try reflexivity.
      simpl.
      apply IHn ; assumption.
 *
 revert l1 l2.      
 cofix Hcof ; intros.
 destruct l1 ; destruct l2.
  + constructor.
  + discriminate (H 0).
  +  discriminate (H 0).
  +  injection (H 0) ; intros; subst.
     constructor ; try reflexivity.
     eapply Hcof ; intros.
    apply (H (S  n)).   
Qed.


Lemma Finite_equal (A : Type) (l1 l2 : lazy_list A) :
Finite l1 -> lazy_equal l1 l2 -> Finite l2.
Proof.
  intros.
  revert H0.
  revert l2.
  induction H ; intros ; subst.
  * inversion H0.
    apply Finite_nil.
 *  inversion H0; subst.
    constructor.
    apply IHFinite ; assumption.
Qed.

(* State and prove that [lazy_equal] preserves [Infinite]. *)


Lemma Infinite_equal(A : Type) (l1 l2 : lazy_list A) :
  Infinite l1 -> lazy_equal l1 l2 -> Infinite l2.
Proof.  
  revert l1 l2.
  cofix Hcof ; intros. 
  destruct l1; destruct l2 ; try assumption.
  * inversion H0.
  *  inversion H0.
  *  inversion H0 ; subst.
     constructor.
     inversion H ; subst.
     eapply Hcof; eauto.
Qed.

(* Prove the following equation linking [lazy_iterate] and [lazy_map]. *)

Lemma lazy_map_iterate (A : Type) (f : A -> A) (x : A) :
lazy_equal (lazy_iterate f (f x)) (lazy_map f (lazy_iterate f x)).
Proof.
  revert x.
  cofix Hcof ; intros.
  rewrite lazy_iterate_unfold.
 replace  (lazy_iterate f x) with (lazy_cons x (lazy_iterate f ( f x))).
*  rewrite lazy_map_cons. 
   constructor ; try reflexivity.
   apply Hcof.
*   rewrite <- lazy_iterate_unfold ; reflexivity.
Qed.

(* Prove that [lazy_append] is associative. *)




Lemma lazy_append_assoc (A : Type) (l1 l2 l3 : lazy_list A) :
lazy_equal
(lazy_append l1 (lazy_append l2 l3))
(lazy_append (lazy_append l1 l2) l3).
Proof.
revert l1.
cofix Hcof ; intros.
destruct l1 ; simpl ;  repeat rewrite lazy_append_nil ; try constructor; try reflexivity  ; try apply lazy_equal_reflexive.
do 3 rewrite lazy_append_cons.
constructor; try reflexivity.
apply Hcof.
Qed.


(* Prove that infinite lists are left zero. *)

Lemma lazy_append_infinite (A : Type) (l1 l2 : lazy_list A) :
Infinite l1 -> lazy_equal l1 (lazy_append l1 l2).
Proof.
revert l1.
cofix Hcof ; intros.
destruct l1.
* destruct (not_Infinite_nil _ H).
* rewrite lazy_append_cons.
  constructor ; try reflexivity.
  apply Hcof.
  eapply Infinite_cons_inv ; eauto.
Qed.

  (* Prove that [omega l] is a fixpoint of [lazy_append l].
Compare with omega_Finite. *)


Lemma omega_append_helper(A : Type) (l1 l2 : lazy_list A):
  lazy_equal (omega_gen l1 l2) (lazy_append l1 (omega_gen l2 l2)).
Proof.
revert l1  l2.
cofix Hcof; intros.
destruct l1.
* rewrite lazy_append_nil.
  rewrite omega_gen_nil_l.
  apply lazy_equal_reflexive.
* rewrite lazy_append_cons.
  rewrite omega_gen_cons_l.
  constructor ; try reflexivity.
  apply Hcof.
Qed.  

Lemma omega_append (A : Type) (l : lazy_list A) :
lazy_equal (omega l) (lazy_append l (omega l)).
Proof.
unfold omega.
apply omega_append_helper.  
Qed.