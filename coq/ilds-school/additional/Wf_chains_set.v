 Require Import Streams.
Require Import Program.
Require Import ClassicalEpsilon.

Section Wf_chains.

  Variable A : Set.
  Variable R : A -> A -> Prop.

Lemma eps : forall P : A -> Prop, (exists x, P x)-> {x | P x}. 
Proof.
apply constructive_indefinite_description.
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
