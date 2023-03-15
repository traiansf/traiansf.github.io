(** This file contains some lemmas you will have to prove, i.e. replacing
   the "Admitted" joker with a sequence of tactic calls, terminated with a 
   "Qed" command.

   Please use only elementary tactics :
   intro[s], apply, assumption
   split, left, right, destruct as,
   assert (only if you don't find another solution)
   and tactic composition.
*)



Section propositional_logic.

 Variables P Q R S T : Prop.

 (* this does not hold in intuitionistic logic *)

Lemma no  : ~~P -> P.
Proof.
  intros.
  (* ?? *)
Abort.

(* it is an axiom in the Classical library *)

Lemma weak_peirce : ((((P -> Q) -> P) -> P) -> Q) -> Q.
 Proof.
intros H.
apply H; intros H0.
apply H0 ; intros H1.
apply H; intros H2.
exact H1.
 Qed.
 
 Lemma and_assoc : P /\ (Q /\ R) -> (P /\ Q) /\ R.
 Proof.
 intros Hpqr.
 destruct Hpqr as [Hp [Hq Hr]].
repeat split ; assumption.
Qed.

 Lemma and_imp_dist : (P -> Q) /\ (R -> S) -> P /\ R -> Q /\ S.
 Proof.
intros Hpqrs Hpr.
destruct Hpqrs as [Hpq Hrs].
destruct Hpr as [Hp Hr].
split.
* apply Hpq ; assumption.
*   apply Hrs ; assumption.
 Qed.
 
Lemma not_contrad :  ~(P /\ ~P).
Proof.
 intro Habs. 
destruct Habs as [Hp Hnotp].
apply Hnotp; assumption.
Qed.

Lemma or_and_not : (P \/ Q) /\ ~P -> Q.
 Proof.
intros Hyp.
destruct Hyp as [Hpq Hnotp]. 
destruct Hpq as [Hp |  Hq ].
* specialize (Hnotp Hp).
  destruct Hnotp.
*  exact Hq.
Qed.
   Lemma not_not_exm : ~ ~ (P \/ ~ P).
 Proof.
intro Habs.
apply Habs.
right.
intro Hp.
apply Habs.
left ; exact Hp.
 Qed.
 
Lemma de_morgan_1 : ~(P \/ Q) -> ~P /\ ~Q.
 Proof.
 intros Hnonpq.
 split.
 * intro Hp.
   apply Hnonpq.
   left ; exact Hp.
* intro Hq.
  apply Hnonpq.
  right ; exact Hq.
 Qed.
 
 Lemma de_morgan_2 : ~P /\ ~Q -> ~(P \/ Q).
 Proof.
   intros Hnonpq' Hnonpq.
   destruct Hnonpq' as [Hnonp' Hnonq'].   
  destruct Hnonpq as [Hnonp | Hnonq].   
 * apply Hnonp'; assumption.
 * apply Hnonq'; assumption.
Qed.   


 Lemma de_morgan_3 : ~P \/ ~Q -> ~(P /\ Q).
 Proof.
intros H1 H2.
destruct H2 as [Hp Hq].
destruct H1 as [Hnonp | Hnonq].
* apply Hnonp; assumption.
*  apply Hnonq; assumption.
Qed.

 Lemma or_to_imp : P \/ Q -> ~ P -> Q.
Proof.
intros Hporq Hnonp.
destruct Hporq as [Hp | Hq]. 
specialize (Hnonp Hp).
* destruct Hnonp.
* exact Hq.  
Qed.

Lemma imp_to_not_not_or : (P -> Q) -> ~~(~P \/ Q).
intros Hpimpq H'.
apply H'.
left.
intro Hp.
apply H'.
right.
apply Hpimpq ; exact Hp.
Qed.


Lemma contraposition : (P -> Q) -> (~Q -> ~P).
Proof.
intros Hpq Hnonq Hp.
apply Hnonq.
apply Hpq; exact Hp.
Qed.

Lemma contraposition' : (~P -> ~Q) <-> (~~Q -> ~~P).
Proof.
 split ; intros.
 * intro Hnonp.
  apply H0.   
  apply H; assumption. 
 * intro Hq.
   apply H.
   + intros Hnonq.
      apply Hnonq ; assumption.    
   + assumption.
Qed.


Lemma contraposition'' : (~P -> ~Q) <-> ~~(Q -> P).
Proof.
  split; intros.
  * intro Hnimp.
    assert (~Q).
    + apply H.
      intro Hp.
      apply Hnimp.
      intro Hq ; exact Hp.
    +  apply Hnimp.
       intro Hq ; destruct (H0 Hq).         
* intro Hq.
  apply H.
  intro Himp.
  specialize (Himp Hq).
  destruct (H0 Himp).
Qed.

