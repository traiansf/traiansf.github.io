    Require Import List.

    Section Term.

    Variables variable function  : Type.

    
    (* the induction principle generated by Coq is not always strong enough, especially if predefined inductive types occur in a given inductive definition, like lists in the following inductive defiinitions of terms *)

    
    Inductive term : Type :=
    | var : variable -> term
    | app : function -> list term -> term.

    Check term_ind.
    (* what is needed is something like term_ind2, see below*)
    
    (* of course, it is possible to redefine lists and have a mutually inductive datatype*)
    (* but then the results in the List library are not available any more*)


   (* when proving induction principles one may use the (very primitive) "fix" tactic for induction, since induction itself is not yet available *)
    (* example with the "fix" tactic:*)

Lemma add_commut : forall x, x + 0 = x.
Proof.
  fix add_commut 1.
  (* this generates an induction hypothesis called add_commut, identical to the goal *)
  (* the constant 1 says induction is performed on the 1st quantified variable, here, x *)

  (* applying the generated hypothesis right now would be unsound*)
  (* thiy this: apply add_commut.  Qed. *)
  (* the command Guarded checks whather the current proof is sound - no need to wait until Qed *)
  
  (* we need to apply the hypothesis on structurally smaller arguments *)
intros [ | x' ]. (* this decomposes x into 0 and S x' *)
- reflexivity.
- cbn.
  rewrite add_commut. (* this is sound since x' is structurally smaller than x*)
  reflexivity.
Qed.

 (* Back to our induction principle on terms. We need to prove term_ind2, but it will be useful to first generalize it as follows, with Q being an auxiliary predicate on lists of terms *)
    Lemma term_ind2_gen :
      forall (P : term -> Prop)(Q : list term -> Prop),
      Q nil ->
      (forall t l, P t -> Q l -> Q (t :: l)) ->
      (forall x, P (var x)) ->
      (forall f l, Q l -> P (app f l)) ->
      forall t, P t.
    Proof.
      fix  term_ind2_gen 7. (* 7 is the seventh "product", corresponding to what we want to prove by induction - forall t, P t*)
      intros P Q HQnil HQapp HPvar HPapp [v | f].
      *  apply HPvar.
      * Guarded. (* we're safe. applying term_ind2_gen above would be unsafe *)
        apply HPapp.
        generalize l.
        fix Hqind 1. (* need induction for Q too, of course *)
        intros [  |  a ].
         + apply HQnil.
         +  apply HQapp.
            eapply term_ind2_gen ; eauto.
             apply Hqind.            
Qed.


    (* use previous lemma *)
    Lemma term_ind2 :
      forall (P : term -> Prop),
      (forall x, P (var x)) ->
      (forall f l, (forall t, In t l -> P t) -> P (app f l)) ->
      forall t, P t.
    Proof.
      intros P HPvar HPapp.
      apply term_ind2_gen with (fun (l : list term) => forall t,  In t l -> P t) ; auto.     
      intros t Hnil ; inversion Hnil.
      intros.
      inversion H1; subst ; auto.
Qed.
      
    End Term.


