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
the accessible part consists on states (elements of A) without successors, or states whose successors are all accessible

 Inductive Acc (x: A) : Prop :=
     Acc_intro : (forall y:A, R y x -> Acc y) -> Acc x.

A relation is well-founded if every element (of its domain) is accessible

 Definition well_founded := forall a:A, Acc a.
*)


Print well_founded.

(* Coq generates a well-founded induction principle, for logical reasoning, i.e., in Prop *)

Check well_founded_ind.

(* and a well-founded induction principle for computational content, i.e., in Type *)

Check well_founded_induction.

(* there is also one for Set, but Set is deprecated *)

(* notice that all require a well-founded relation *)

(* the standard library provides us with some useful ways of proving that relations are well-founded. For instance the usual < relation on nat, a.k.a.  lt, is well-founded : *)

(* Lemma lt_wf : well_founded lt. *)

(* Here's another way of proving that a relation is well-founded*)
Section Subrel.

Variable A : Type.

Definition subRel  ( S R : A -> A -> Prop) : Prop := 
forall x y, S x y -> R x y.


Theorem subrel_wf : forall R S, well_founded R -> subRel S R -> well_founded S.
constructor.
generalize (well_founded_induction H (fun a => forall y, S y a -> Acc S y)) ; intros.
eapply H1 ; clear H1; eauto ; intros.
unfold subRel in H0.
specialize (H0 _ _ H3).
specialize(H1 _ H0).
constructor ; auto.
Qed.

End Subrel.

(*other useful material is found in libraries Coq.Arith.Wf_nat and Coq.Init.Wf *)

(* what is the relation between Coq's notion of well-foundedness and our usual mathematical definitions ?*)
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


(* An exercice regarding the recipeocal of this theorem this is given at the end of this file. *) 

  (* exercice : lexicograpical product of two well-founded relations is well-founded *)

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



  (* let us now go back to the well-specified division. Notice that a "natural" recursive definition is not structural:
for all 0 < b <= a, div a b = div (a - b) b *)
  
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

(*rest of ç/4. Proj1_sig is "extract" seen in rich types session*)
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



(* and now bacl to relations between Coq's well-foundedness and the usual mathematical notion *)
(* for non-well-founded orders such that predecessors of non-accessible states are computable, we construct finite descending chains of arbitrary length.*)

Section reverse_non_decreasing_approx.
Variable A : Type.  
Variable R:  A -> A -> Prop.
Variable a : A.
Hypothesis non_Acc : ~Acc R a. (* R is not well-founded - there is a non-accessible element a *)
Hypothesis non_Acc_pred_ex : forall x, ~Acc R x -> {y : A | R y x /\ ~Acc R y}. (* predecessors of non-accessible elements are computable, and non-accessible as well *)

Program Fixpoint seq(n:nat) {struct n} : (* now construct for any given n a descending sequence of length n *)
  {f: nat -> A | ~Acc R (f n) /\ forall j, j < n -> R (f (S j )) (f j) }:= _ .
Next Obligation.
induction n.
*exists (fun n => a).
 split ; try assumption.
intros ; omega.
* destruct IHn as [f' [Hnon_Acc Hforall]].
  specialize (non_Acc_pred_ex _ Hnon_Acc).
  destruct non_Acc_pred_ex as [y [Hry HnonAcc_y]].

  exists (fun k =>  match (le_gt_dec  k n) with
                    |left _ => f' k
                    |right _ => match eq_nat_dec k (S n) with
                                |left _ => y
                                |right_ => a
                                end
                    end).
  split.
+ destruct (le_gt_dec) ; try   omega.
  destruct Nat.eq_dec ; auto.
+ intros.
  destruct   (le_gt_dec (S j) n).
   - destruct (le_gt_dec j n).
     ** apply Hforall; try omega.
    **   destruct (le_gt_dec j  (S n)) ; 
        destruct (Nat.eq_dec  j (S n)) ; try omega.
   -  assert (j = n) ; try omega ; subst.
      destruct Nat.eq_dec ; try omega.
      destruct le_gt_dec ; try omega ; assumption.
Defined. 


End reverse_non_decreasing_approx.