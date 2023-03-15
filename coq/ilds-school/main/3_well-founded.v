(* well-founded induction *)
Require Import Omega.

(* standard functions in Coq have to be structurally recursive *)
(* how do we overcome this limitation ?*)
(* also, how do we prove theorems by well-founded induction ?*)
(* solution is in the library. Excerpt: *)

(*
Section Wf.
 Variable A : Type.
 Variable R : A -> A -> Prop.

(*the accessible part of a relation R: think of R as the transition relation of a transition system.
the accessible part consists on states (elements of A) without predecessors, or states whose predecessors are all accessible*)

 Inductive Acc (x: A) : Prop :=
     Acc_intro : (forall y:A, R y x -> Acc y) -> Acc x.

(*A relation is well-founded if every element (of its domain) is accessible*)

 Definition well_founded := forall a:A, Acc a.
End Wf.
*)

(*  BTW, thanks to the section mechanism, Variables  become additional arguments*)
Print well_founded.

(* Coq generates a well-founded induction principle, for logical reasoning, i.e., in Prop *)

Check well_founded_ind.

(* and a well-founded induction principle for computational content, i.e., in Set *)

Check well_founded_induction.

(* there is also one for Type *)

(* notice that all require a well-founded relation *)

(* the standard library provides us with some useful ways of proving that relations are well-founded. For instance the usual < relation on nat, a.k.a.  lt, is well-founded : *)

Check lt_wf.

(* Here's another way of proving that a relation is well-founded*)
Section Subrel.

Variable A : Type.

Definition subRel  ( S R : A -> A -> Prop) : Prop := 
forall x y, S x y -> R x y.

(* this won't parse if you don't comment one the above section...*)
Theorem subrel_wf : forall R S, well_founded R -> subRel S R -> well_founded S.
Proof.
  constructor.
  (* the arguments of well_founded_induction found from the conclusion*)
generalize (well_founded_ind H (fun a => forall y, S y a -> Acc S y)) ; intros.
Admitted.

End Subrel.

(*other useful material is found in libraries Coq.Arith.Wf_nat and Coq.Init.Wf *)


  (* let us now go back to the well-specified division. Notice that a "natural" recursive definition is not structural:
for all 0 < b <= a, div a b = 1 + div (a - b) b *)
  
Definition div_specified : forall a b:nat, 0 <  b ->  {q:nat &{r:nat | a = q*b + r /\ 0 <= r < b}}.
Proof.
  induction a as [a Hrec] using (well_founded_induction lt_wf).
  intros.
  case (lt_eq_lt_dec a b); intro Hcomp.
Admitted.

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
Admitted.

(* ********** *)
(* additional exercices, only if there is enough time after the quicksort exercice *)


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
Admitted.

(* reciprocal of above theorem *)
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
Admitted.

Definition rich_R : {x  | ~ Acc R x}  ->   {x  | ~ Acc R x} -> Prop.
Admitted.


Lemma ex_f:  forall x : {x : A | ~ Acc R x}, {y : {x0 : A | ~ Acc R x0} | rich_R x y}.
Admitted.

End Wf_chains.



Theorem Wf_chains : forall (A:Set) R,~ well_founded R ->
    exists f : nat -> A,  forall n, R (f (S n))(f n).
   Admitted.



 (* lexicograpical product of two well-founded relations is well-founded *)

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
  +  admit.
  +  generalize (well_founded_induction_type wf_leB (fun b => Q b)) ; intros H1.
     admit.
Admitted.     
 
Theorem wf_LexProd : well_founded LexProd.
Proof.
Admitted.
  End LexProd.
  (* end additional exercices *)