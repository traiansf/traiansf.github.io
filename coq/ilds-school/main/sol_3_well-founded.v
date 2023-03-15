(* well-founded induction *)
Require Import Omega.

(* standard functions in Coq have to be structurally recursive *)
(* how do we overcome this limitation ?*)
(* also, how do we prove theorems by well-founded induction ?*)
(* solution is in the library *)

(*

 Variable A : Type.
 Variable R : A -> A -> Prop.

the accessible part of a relation R: think of R as the transition relation of a transition system.
the accessible part consists on states (elements of A) without predecessors, or states whose predecessors are all accessible

 Inductive Acc (x: A) : Prop :=
     Acc_intro : (forall y:A, R y x -> Acc y) -> Acc x.

A relation is well-founded if every element (of its domain) is accessible

 Definition well_founded := forall a:A, Acc a.
*)


Print well_founded.

(* Coq generates a well-founded induction principle, for logical reasoning, i.e., in Prop *)

Check well_founded_ind.

(* and a well-founded induction principle for computational content, i.e., in Set  resp. Type*)

Check well_founded_induction.
Check well_founded_induction_type.

(* notice that all require a well-founded relation *)

(* the standard library provides us with some useful ways of proving that relations are well-founded. For instance the usual < relation on nat, a.k.a.  lt, is well-founded : *)

(* Lemma lt_wf : well_founded lt. *)

(* Here's another way of proving that a relation is well-founded*)
Section Subrel.

Variable A : Type.

Definition subRel  ( S R : A -> A -> Prop) : Prop := 
forall x y, S x y -> R x y.


Theorem subrel_wf : forall R S, well_founded R -> subRel S R -> well_founded S.
  intros ; constructor.
  revert a.
apply (well_founded_ind H (fun a => forall y, S y a -> Acc S y)); intros.
unfold subRel in H0.
specialize (H0 _ _ H2).
specialize(H1 _ H0).
constructor. auto.
Qed.

End Subrel.

(*other useful material is found in libraries Coq.Arith.Wf_nat and Coq.Init.Wf *)




  (* let us now go back to the well-specified division. Notice that a "natural" recursive definition is not structural:
for all 0 < b <= a, div a b = 1 + div (a - b) b *)
  
Definition div_specified : forall a b:nat, 0 <  b ->  {q:nat &{r:nat | a = q*b + r /\ 0 <= r < b}}.
Proof.
  induction a as [a Hrec] using (well_founded_induction lt_wf).
  intros.
  case (lt_eq_lt_dec a b); intro Hcomp.
  * destruct Hcomp as [Hlt | Heq].
   + exists 0, a.
    repeat split ; auto.
    omega.
   +  subst.
      exists 1, 0.
      repeat split ; auto ; omega.
      * assert(Hmin :  (a - b) < a) ; try omega.
        specialize (Hrec _ Hmin _ H).
        destruct Hrec as [q [r Hstuff]].
        exists (S q), r.
        repeat split ; intuition ; auto.
        simpl ; omega.
Defined.

(* to make Ocaml extracted code look nicer *)
Require Import ExtrOcamlBasic.
Require Import ExtrOcamlNatInt.

Recursive Extraction  div_specified.


(* computing 9 divided by 4. Need a proof of 0 < 4 *)
Lemma zero_four : 0 < 4.
  auto with arith.
Qed.

(*quitient of 9/4*)
Compute projT1 (div_specified 9 4 zero_four).

(*rest of 9/4. Proj1_sig is "extract" seen in rich types session*)
Compute (proj1_sig (projT2 (div_specified 9 4 zero_four))).

(* alternative way of defining functions by proof: Program command*)

Require Import Program.
Program Fixpoint  div_specified' (a b:nat) {measure a}:  0 <  b ->  {q:nat &{r:nat | a = q*b + r /\ 0 <= r < b}} := _ .
Next Obligation.
case (lt_eq_lt_dec a b); intro Hcomp.
  * destruct Hcomp as [Hlt | Heq].
   + exists 0, a.
    repeat split ; auto.
    omega.
   +  subst.
      exists 1, 0.
      repeat split ; auto ; omega.
      * assert(Hmin :  (a - b) < a) ; try omega.
        specialize (div_specified' _  _ Hmin H ). 
        destruct div_specified' as [q [r Hstuff]].
        exists (S q), r.
        repeat split ; intuition ; auto.
        simpl ; omega.
Defined.

(** ********** *)
(* additional exercices, only if there is enough time after the quicksort exercice *)


(*  relations between Coq's well-foundedness and the usual mathematical notion *)

(* one implication : Coq's well-foundedness implies that there are no infinite descending chains *)
Theorem not_decreasing :
forall (A:Set) (R:A ->A ->Prop),
well_founded R ->
~(exists seq:nat -> A,  forall i:nat, R (seq (S i))(seq i)).
Proof.
  intros A R Hwf.
  generalize (well_founded_ind Hwf ( fun a =>   ~ (exists (seq : nat -> A)(j:nat), a = seq(j) /\ forall i : nat, R (seq (S i)) (seq i)))) ; intros.
  cut (forall a : A, ~ (exists (seq : nat -> A)(j:nat), a = seq j /\ (forall i : nat, R (seq (S i)) (seq i)))) ; intro Hcut.
  * intro Habs.
    destruct Habs as [seq Hseq].
    specialize (Hcut (seq 0))  ;apply Hcut.
    now exists seq, 0.
 *  apply H; clear H ; intros; auto.
   clear Hcut.    
    intro Habs.
    destruct Habs as [seq [ j [Hx Hseq]]].
    rewrite  Hx in *.
    generalize  (Hseq j) ; intro Hseqj.
    specialize (H _ Hseqj).
    apply H.
    now exists seq, (S j).
Qed.


(* Reciprocal of above theorem:. *)
(* need classical logic and Hilbert's epsilon operation *)
Require Import ClassicalEpsilon.

Section Wf_chains.

  Variable A : Set.
  Variable R : A -> A -> Prop.

Lemma eps : forall P : A -> Prop, (exists x, P x)-> {x | P x}. 
Proof.
apply constructive_indefinite_description. (* from ClassicalEpsilon lib *)
Qed.

Lemma usesClassic : forall x,  ~Acc R x -> exists y,  ~ Acc R y /\ R y x.
Proof.
  intros.
generalize (Acc_intro); intro Haccin.
specialize (Haccin A R x).
assert (~ (forall y : A, R y x -> Acc R y)).
* intuition.
* apply not_all_not_ex.
  intro Hall.
  apply H0.
  intros y HRyx.
  specialize (Hall y).
  tauto.
Qed.

Definition rich_R : {x  | ~ Acc R x}  ->   {x  | ~ Acc R x} -> Prop.
Proof.
  intros.
  destruct H, H0.
  exact (R x0 x).
Defined.


Lemma ex_f:  forall x : {x : A | ~ Acc R x}, {y : {x0 : A | ~ Acc R x0} | rich_R x y}.
Proof.
  intros.
  destruct x.
  specialize (usesClassic _ n) ; intro Huse.
  specialize (eps (fun y => ~Acc R y /\ R y x)) ; simpl ; intros HX.
  destruct (HX Huse).
  destruct a.
  exists (exist _ x0 H) ; auto.
Qed.

End Wf_chains.



Theorem Wf_chains : forall (A:Set) R,~ well_founded R ->
    exists f : nat -> A,  forall n, R (f (S n))(f n).
   Proof.
  unfold well_founded ; intros A R Hnwf.
  destruct (not_all_ex_not _ _ Hnwf).
  generalize dependent_choice  ; intro Hdc.
  specialize (Hdc   _ (rich_R A R)  (ex_f A R) (exist  _ x H)).
  destruct Hdc,a ; simpl in *.
  unfold rich_R in * ; simpl.
  exists (fun n => proj1_sig (x0 n)) ;intro n.
  specialize (H1 n).
  simpl.
  destruct (x0 n), (x0 (S n)) ; assumption.
Qed.

  (*  lexicograpical product of two well-founded relations is well-founded *)

  Section LexProd .

Variable A  B : Type.
Variable leA : A -> A -> Prop.
Variable leB : B -> B -> Prop.

Inductive LexProd : (A*B) -> (A*B) -> Prop :=
    | leftLexProd :
      forall (x x':A) (y y':B),
        leA x x' -> LexProd (x, y) (x', y')
    | rightLexProd :
      forall (x:A) (y y':B),
        leB y y' -> LexProd (x, y) (x, y').

Variable wf_leA : well_founded leA.
Variable wf_leB : well_founded leB.


(* all pairs with component a are accessible *)
Definition allpairs_comp_acc(a:A) : Prop :=  forall b, Acc LexProd (a,b).

(* a well-founded induction principle for all pairs with component a *)
Lemma wfPrincA  : forall a,  (forall a',  leA a' a -> allpairs_comp_acc a') -> allpairs_comp_acc a.
Proof.
  intros a0 H.
set (Q :=  fun b => Acc LexProd (a0, b)).
assert (forall b ,  (forall b',  leB b' b -> Q b') -> Q b).
  +  intros b0 Hb0.
     unfold Q.
     constructor ; intro y ; destruct y as (c,d) ; intro Hlex.
     inversion Hlex ; subst.
     - apply H ; assumption.
     - apply Hb0 ; assumption.
  +  generalize (well_founded_induction_type wf_leB (fun b => Q b)) ; intros H1.
     unfold  allpairs_comp_acc.
     unfold Q in *.
     apply H1 ; auto.
Qed.

 
Theorem wf_LexProd : well_founded LexProd.
Proof.
  unfold well_founded ; intro a.
destruct a.   
generalize b ; clear b.
replace (forall b : B, Acc LexProd (a, b)) with ( allpairs_comp_acc  a) ; auto.
apply (well_founded_induction_type wf_leA  allpairs_comp_acc ) ; intros.
apply wfPrincA ; auto.
Qed.

  End LexProd.
  (* end additional exercices *)