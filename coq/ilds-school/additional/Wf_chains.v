Require Import Streams.
Require Import Program.
Require Import ClassicalEpsilon.

Section Wf_chains.

  Variable A : Type.
  Variable R : A -> A -> Prop.

 Lemma stream_match  (A': Type)(l : Stream A') :
       l = match l with  Cons a l' => Cons a l' end.
 Proof. 
  destruct l; reflexivity. 
  Qed.

CoFixpoint iterate {A' : Type} (f : A' -> A') (a' : A') : Stream A' :=
Cons a' (iterate f (f a')).


Lemma iterate_unfold(A':Type)(f : A' -> A')(x:A') :
  iterate f x = Cons x (iterate f (f x)).
Proof.
etransitivity.
{
  apply stream_match.
}
cbn.
reflexivity.
Qed.



CoInductive infiniteDecreasingChain  : Stream A -> Prop :=
  | ChainCons : forall x y s, infiniteDecreasingChain  (Cons y s)
    -> R y  x
    -> infiniteDecreasingChain  (Cons x (Cons y s)).


Lemma infinite_cons: forall x s,
infiniteDecreasingChain s -> R (hd s) x  -> infiniteDecreasingChain (Cons x s).
Proof.
  intros.
  destruct s.
  constructor; simpl in * ; try assumption.
Defined.



Lemma eps : forall P : A -> Prop, (exists x, P x)-> {x | P x}. 
Proof.
apply constructive_indefinite_description.
Qed.


Lemma useClas : forall x,  ~Acc R x -> exists y,  ~ Acc R y /\ R y x.
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



Lemma nonAcc_pre : forall x, ~Acc R x -> {y | ~Acc R y & R y x}.
Proof.
intros.
specialize (useClas _ H) ; intro Huse.
specialize (eps (fun y => ~Acc R y /\ R y x)) ; simpl; intros HX.
destruct (HX Huse).
exists x0 ; intuition.
Qed.

 Program Definition
   f : {  g :   {x:A | ~Acc R x} -> {x:A | ~Acc R x} | forall X,  R (proj1_sig (g X) ) (proj1_sig X) } := _ .
Next Obligation.
  exists
(fun Y => match Y with  (exist _ x Hxnacc) =>
                                 match (nonAcc_pre x Hxnacc) with
                                   (exist2 _ _ u H1  H2)  => (exist _ u H1)  
                                 end
          end).
intros [x Hxnacc].  
destruct  (nonAcc_pre x Hxnacc).
assumption.
Defined.

Definition  pre : {x:A | ~Acc R x} -> {x:A | ~Acc R x} := proj1_sig f.
Definition  pre_R : forall X,  R (proj1_sig (pre X) ) (proj1_sig X)  := proj2_sig f.


Definition rich_seq(x:A)(x_nonAcc: ~ Acc R x) := iterate pre (exist  _  x   x_nonAcc).

Definition poor_seq(x:A)(x_nonAcc: ~ Acc R x)  := map (fun X => proj1_sig X) (rich_seq x x_nonAcc).

Lemma map_Cons (A'  B : Type) (f : A' -> B) (a' : A') (l : Stream A') :
  map f (Cons a' l) = Cons (f a') (map f l).
Proof.
etransitivity.
{
  apply stream_match.
}
cbn.
reflexivity.
Defined.


Lemma poor_seq_inf : forall x x_nonAcc, infiniteDecreasingChain   (poor_seq x x_nonAcc).
Proof.
  unfold poor_seq, rich_seq.
  cofix Hcof ; intros.
  rewrite iterate_unfold.
  rewrite map_Cons.
  simpl.
  apply infinite_cons; simpl.
  *   destruct ((pre (exist (fun x0 : A => ~ Acc R x0) x x_nonAcc))).
      apply Hcof.
*   apply pre_R.
Qed.
End Wf_chains.

Theorem Wf_chains : forall A R,~ well_founded R -> exists s,  infiniteDecreasingChain A R s.
Proof.
  unfold well_founded ; intros A R Hnwf.
  destruct (not_all_ex_not _ _ Hnwf).
  exists (poor_seq _ _ x H).
  apply poor_seq_inf.
Qed.
