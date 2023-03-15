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
Admitted.
 
 Lemma and_assoc : P /\ (Q /\ R) -> (P /\ Q) /\ R.
 Proof.
Admitted.

 Lemma and_imp_dist : (P -> Q) /\ (R -> S) -> P /\ R -> Q /\ S.
 Proof.
Admitted.
 
Lemma not_contrad :  ~(P /\ ~P).
Proof.
Admitted.

Lemma or_and_not : (P \/ Q) /\ ~P -> Q.
Proof.
Admitted.  

Lemma not_not_exm : ~ ~ (P \/ ~ P).
 Proof.
 Admitted.
 
Lemma de_morgan_1 : ~(P \/ Q) -> ~P /\ ~Q.
 Proof.
Admitted.
 
 Lemma de_morgan_2 : ~P /\ ~Q -> ~(P \/ Q).
 Proof.
Admitted.


 Lemma de_morgan_3 : ~P \/ ~Q -> ~(P /\ Q).
 Proof.
Admitted.

 Lemma or_to_imp : P \/ Q -> ~ P -> Q.
Proof.
Admitted.

Lemma imp_to_not_not_or : (P -> Q) -> ~~(~P \/ Q).
Proof.
Admitted.

Lemma contraposition : (P -> Q) -> (~Q -> ~P).
Proof.
Admitted.

Lemma contraposition' : (~P -> ~Q) <-> (~~Q -> ~~P).
Proof.
Admitted.


Lemma contraposition'' : (~P -> ~Q) <-> ~~(Q -> P).
Proof.
Admitted.

