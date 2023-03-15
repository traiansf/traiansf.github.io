    Require Import List.

    Section Term.

    Variables variable function  : Type.

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
    fix H1 7; intros P Q H2 H3 H4 H5 [ x |  f  ].
    - apply H4.
    - apply H5; revert l; fix H7 1; intros [ | t l].
      + apply H2.
      + apply H3.
        * apply H1 with (Q:=Q).
          -- apply H2.
          -- apply H3.
          -- apply H4.
             -- apply H5.
      * apply H7.
    Qed.

    Lemma term_ind2 :
      forall (P : term -> Prop),
      (forall x, P (var x)) ->
      (forall f l, (forall t, In t l -> P t) -> P (app f l)) ->
      forall t, P t.
    Proof.
    intros P H1 H2  t.
    apply term_ind2_gen with (Q := fun l => forall t, In t l -> P t); simpl; try tauto.
    clear H1 H2  t; intros t1 l H1 H2 t2 [H3 | H3].
    - subst; trivial.
    - auto.
    Qed.

    End Term.


