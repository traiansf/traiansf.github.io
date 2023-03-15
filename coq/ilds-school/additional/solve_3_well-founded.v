(* well-founded induction *)
Require Import Omega.

(* standard functions in Coq have to be structurally recursive *)
(* how do we overcome this limitation ?*)
(* also, how do we prove therems by well-founded induction ?*)
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

Check lt_wf.

(* Here's another one*)
Section Subrel.

Variable A : Type.

Definition subRel  ( S R : A -> A -> Prop) : Prop := 
forall x y, S x y -> R x y.


Theorem subrel_wf : forall R S, well_founded R -> subRel S R -> well_founded S.
Proof.
  constructor.
  (* the arguments of well_founded_induction found from the conclusion*)
  generalize (well_founded_induction H (fun a => forall y, S y a -> Acc S y)) ; intros.
  eapply H1  ; eauto; clear H1 ; intros.
assert (HR : R y0 x).
  *  eapply H0 ; eauto.
  *    unfold well_founded in H.
       specialize (H y0).
       constructor ; intros.
       inversion H ; subst.
       eapply H1 ; eauto.
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
  (* Hint : prove something stronger: there is no infinite descending chain starting from any a s.t. a = seq(i) for some i *)
  generalize (well_founded_ind Hwf ( fun a =>   ~ (exists (seq : nat -> A)(j:nat), a = seq(j) /\ forall i : nat, R (seq (S i)) (seq i)))) ; intros.
 (* assume the stronger thing to prove the theorem's statement, then prove the stronger thing *)
  cut (forall a : A, ~ (exists (seq : nat -> A)(j:nat), a = seq j /\ (forall i : nat, R (seq (S i)) (seq i)))) ; intro Hcut.
   * intro Habs.
    destruct Habs as [seq Habs].
    apply Hcut with (seq 0).
    exists seq, 0; split ; auto.
   * apply H ; intros ; subst ; clear H.
     intro Habs.
     destruct Habs as [seq [j [Hseq HR]]].
     generalize (HR j); intros ; subst.
     specialize (H0 _ H).
     apply H0 ; clear H0.
    exists seq, (S j); split; auto.     
Qed.

(*NB  the opposite implication requires classical logic. Proving it is rather hard.   *) 


  Section Wf_inf.
  (* we prove this instead: every nonempty set has a minimal element *)
Require Import Coq.Logic.Classical_Prop.
  Variable A : Type.
  Variable ltA : A -> A -> Prop.
  Hypothesis wf_ltA : well_founded ltA.
  Variable P : A -> Prop.

  Definition sat := exists b, P b. (* P as a "set* is nonempty *)
  Definition inf(a:A):= P a /\ forall b,  P b -> ~ ltA b a. (* a is minimal "in" P*)

  Theorem nonempty_inf : sat  -> exists a, inf a.
  Proof.
    unfold sat, inf.
    intros.
    destruct H as [b Hex].
    unfold well_founded in wf_ltA.
    specialize (wf_ltA b).
    induction wf_ltA.
    destruct (classic (exists y, ltA y x /\ P y)).
    * destruct H1 as [y [Hlt Hpy]].
      specialize (H _ Hlt).
      eapply H0; eauto.
    *  exists x ; split ; auto ; intros.
       intro Habs.
       apply H1.
       exists b; split; auto.
Qed.
  End Wf_inf.
  (* be sure not to use classical logic for the rest of this session *)


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
+  intros.
   unfold Q in *.
   constructor; intros [a' b'] Hlp.
   inversion Hlp ; subst.
   *  apply H ; auto.
   *   apply H0 ; auto.
+  generalize (well_founded_induction_type wf_leB (fun b => Q b)) ; intros H1.
   specialize (H1 H0).
   unfold Q in *.
   intros; auto.
Qed.
 
Theorem wf_LexProd : well_founded LexProd.
Proof.
unfold well_founded.
intros [a b].
generalize (well_founded_induction_type wf_leA (fun a' =>    allpairs_comp_acc a')) ; intros.
apply H ; intros ; clear H.
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
  * destruct Hcomp ; intros ; subst.
  + exists 0, a ; repeat split ; simpl ; auto with arith.
  + exists 1, 0; repeat split ; simpl ; try omega.
    * assert (Hab : a- b < a) ; try omega.
      specialize (Hrec _ Hab _ H).
      destruct Hrec as [q [r [Hqr Hqr']]].
      exists (S q), r ;  repeat split ; simpl ; try omega.
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
 intros.
  case (lt_eq_lt_dec a b); intro Hcomp.
  * destruct Hcomp ; intros ; subst.
  + exists 0, a ; repeat split ; simpl ; auto with arith.
  + exists 1, 0; repeat split ; simpl ; try omega.
    * assert (Hab : a- b < a) ; try omega.
      specialize (div_specified' _ _ Hab  H).
      destruct div_specified' as [q [r [Hqr Hqr']]].
      exists (S q), r ;  repeat split ; simpl ; try omega.
Defined.
