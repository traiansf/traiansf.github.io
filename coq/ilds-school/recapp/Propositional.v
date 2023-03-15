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
Abort.

(* it is an axiom in the Classical library *)

Lemma weak_peirce : ((((P -> Q) -> P) -> P) -> Q) -> Q.
Proof.
  intro HQ.
  apply HQ.
  intro HP.
  apply HP.
  intro Hp.
  apply HQ.
  intro.
  exact Hp.
Qed.

Lemma and_assoc : P /\ (Q /\ R) -> (P /\ Q) /\ R.
Proof.
  intros (Hp & Hq & Hr).
  repeat split; assumption.
Qed.

Lemma and_imp_dist : (P -> Q) /\ (R -> S) -> P /\ R -> Q /\ S.
Proof.
  intros [Hpq Hrs] [Hp Hr].
  split.
  - apply Hpq; assumption.
  - apply Hrs; assumption.
Qed.
 
Lemma not_contrad :  ~(P /\ ~P).
Proof.
  intros [Hp Hnp].
  apply Hnp; assumption.
Qed.

Lemma or_and_not : (P \/ Q) /\ ~P -> Q.
Proof.
  intros [[Hp | Hq] Hnp].
  - elim Hnp; assumption.
  - assumption.
Qed.

Lemma not_not_exm : ~ ~ (P \/ ~ P). (* some mind gymnastics  *)
Proof.
  intro H; apply H.
  right.
  contradict H.
  left; assumption.
Qed.
 
Lemma de_morgan_1 : ~(P \/ Q) -> ~P /\ ~Q.
Proof.
  intros Hpq; split; contradict Hpq.
  - left; assumption.
  - right; assumption.
Qed.
 
Lemma de_morgan_2 : ~P /\ ~Q -> ~(P \/ Q).
Proof.
  intros [Hnp Hnq] [Hp | Hq].
  - apply Hnp; assumption.
  - apply Hnq; assumption.
Qed.

Lemma de_morgan_3 : ~P \/ ~Q -> ~(P /\ Q).
Proof.
  intros [Hnp | Hnq] [Hp Hq].
  - apply Hnp; assumption.
  - apply Hnq; assumption.
Qed.

Lemma or_to_imp : P \/ Q -> ~ P -> Q.
Proof.
  intros [Hp | Hq] Hnp.
  - elim Hnp; assumption.
  - assumption.
Qed.

Lemma imp_to_not_not_or : (P -> Q) -> ~~(~P \/ Q). (* some mind gymnastics  *)
Proof.
  intros Hpq Hn.
  apply Hn.
  left; intro Hp.
  apply Hn.
  right; apply Hpq; assumption.
Qed.

Lemma contraposition : (P -> Q) -> (~Q -> ~P).
Proof.
  intros Hpq Hnq.
  contradict Hnq.
  apply Hpq; assumption.
Qed.

Lemma contraposition' : (~P -> ~Q) <-> (~~Q -> ~~P).
Proof.
  split.
  - intros Hnpnq Hnnq.
    contradict Hnnq.
    apply Hnpnq; assumption.
    - intros Hnnqnnp Hnp Hq.
      apply Hnnqnnp.
      + intro Hnq.
        apply Hnq; assumption.
      + assumption.
Qed.

Lemma contraposition'' : (~P -> ~Q) <-> ~~(Q -> P). (* some more mind gymnastics *)
Proof.
  split.
  - intros Hnpnq Hnqp.
    apply Hnqp.
    intro Hq.
    exfalso.
    apply Hnpnq; [| assumption].
    contradict Hnqp.
    intro; assumption.
  - intros Hnnqp Hnp.
    contradict Hnnqp.
    contradict Hnp.
    apply Hnp; assumption.
Qed.
