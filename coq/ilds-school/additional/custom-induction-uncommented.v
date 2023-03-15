    Require Import List.

    Section Term.

    Variables variable function  : Type.

    (*show alternative: redefining lists*)
    (*don't give the first lemma  *)
    (*exemple avec fix *)
    
    Inductive term : Type :=
    | var : variable -> term
    | app : function -> list term -> term.

    Lemma term_ind2_gen :
      forall (P : term -> Prop)(Q : list term -> Prop),
      Q nil ->
      (forall t l, P t -> Q l -> Q (t :: l)) ->
      (forall x, P (var x)) ->
      (forall f l, Q l -> P (app f l)) ->
      forall t, P t.
    Proof.
  Admitted.

    (* use previous lemma *)
    Lemma term_ind2 :
      forall (P : term -> Prop),
      (forall x, P (var x)) ->
      (forall f l, (forall t, In t l -> P t) -> P (app f l)) ->
      forall t, P t.
    Proof.
   Admitted.

    End Term.


