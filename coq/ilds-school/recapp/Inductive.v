(* a sequence of exercices about lits and proofs by induction*)
(* will be reused in a later exercice about the quicksort function*)
Require Import List Lia PeanoNat Compare_dec Program.
Import Nat ListNotations.

Definition partition_one (n : nat) (a : nat) (l : list nat * list nat) : list nat * list nat :=
  let (l1,l2) := l in
    if (le_lt_dec a n)
    then (a::l1,l2)
    else (l1, a::l2).

(*decomposing the list  l in two parts: elements <= n, elements > n *)
Definition partition (n : nat) (l : list nat) : (list nat * list nat) :=
  fold_right (partition_one n) ([], []) l.

(* a good practice is to write equality lemmas, to be used  for rewriting in subsequent proofs *)
Lemma partition_one_fst_le_cons : forall a n l,  a <= n -> fst( partition_one n a l)  = a :: (fst l).
Proof.
  unfold partition_one.
  destruct l, (le_lt_dec a n); [reflexivity | lia].
Qed.

Lemma partition_fst_le_cons : forall a n l,  a <= n -> fst( partition n (a :: l))  = a :: (fst (partition n l)).
Proof.
  intros; cbn.
  rewrite partition_one_fst_le_cons by assumption.
  reflexivity.
Qed.

Lemma partition_one_snd_le_no_cons : forall a n l,  a <= n -> snd (partition_one n a l) = snd l.
Proof.
  unfold partition_one.
  destruct l, (le_lt_dec a n); [reflexivity | lia].
Qed.

Lemma partition_snd_le_no_cons : forall a n l,  a <= n -> snd (partition n (a:: l))  = snd (partition n l).
  intros; cbn.
  rewrite partition_one_snd_le_no_cons by assumption.
  reflexivity.
Qed.

Lemma partition_one_fst_gt_no_cons : forall a n l,  a > n -> fst (partition_one n a l)  = fst l.
Proof.
  unfold partition_one.
  destruct l, (le_lt_dec a n); [lia | reflexivity].
Qed.

Lemma partition_fst_gt_no_cons : forall a n l,  a > n -> fst( partition n (a :: l))  = fst (partition n l).
  intros; cbn.
  rewrite partition_one_fst_gt_no_cons by assumption.
  reflexivity.
Qed.

Lemma partition_one_snd_gt_cons : forall a n l,  a > n -> snd( partition_one n a l)  = a :: (snd l).
Proof.
  unfold partition_one.
  destruct l, (le_lt_dec a n); [lia | reflexivity].
Qed.

Lemma partition_snd_gt_cons : forall a n l,  a > n -> snd( partition n (a :: l))  = a :: snd (partition n l).
Proof.
  intros; cbn.
  rewrite partition_one_snd_gt_cons by assumption.
  reflexivity.
Qed.

Lemma  partition_fst_le : forall l n m,  In m (fst (partition n l)) -> m <= n .
Proof.
  induction l; [inversion 1 |].
  intros n m.
  destruct (le_lt_dec a n).
  - rewrite partition_fst_le_cons by assumption.
    inversion 1; [subst; assumption | apply IHl; assumption].
  - rewrite partition_fst_gt_no_cons by lia.
    apply IHl.
Qed.

Lemma partition_snd_gt : forall n m l,  In m (snd (partition n l)) -> n < m .
Proof.
  intros n m l; revert m.
  induction l; [inversion 1 |].
  intro m.
  destruct (le_lt_dec a n).
  - rewrite partition_snd_le_no_cons by assumption.
    apply IHl.
  - rewrite partition_snd_gt_cons by lia.
    inversion 1; [subst; assumption | apply IHl; assumption].
Qed.

Lemma  partition_left_shorter : forall l n, length (fst (partition n l)) < length (n::l).
Proof.
  intros l n; cbn; induction l; [cbn; lia |].
  destruct (le_lt_dec a n).
  - rewrite partition_fst_le_cons by assumption.
    cbn; lia.
  - rewrite partition_fst_gt_no_cons by lia.
    cbn; lia.
Qed.

Lemma partition_right_shorter : forall l n, length( snd (partition  n l)) < length (n :: l).
Proof.
  intros l n; cbn; induction l; [cbn; lia |].
  destruct (le_lt_dec a n).
  - rewrite partition_snd_le_no_cons by assumption.
    cbn; lia.
  - rewrite partition_snd_gt_cons by lia.
    cbn; lia.
Qed.

(* an inductive relation defining sortedness of lists of naturals *)
Inductive  sorted : list nat->  Prop :=
|sorted_nil : sorted []
|sorted_single : forall n, sorted [n]
|sorted_app : forall l1 l2,  sorted l1 -> sorted l2 ->
  (forall x y, In x l1 -> In y l2 -> x <= y) -> sorted (l1 ++ l2).

(* number of occurences of an element in a list *)
Fixpoint nb_occ n l :=
  match l with
  | [] => 0
  | a :: l' =>
    if (Nat.eq_dec a n)
    then S (nb_occ n l')
    else nb_occ n l'
end.      

Lemma nb_occ_cons : forall a n l, a = n -> nb_occ a (n :: l) = S (nb_occ a l).
Proof.
  intros; cbn.
  destruct (eq_dec n a); [reflexivity | congruence].
Qed.

Lemma nb_occ_cons_neq : forall a n l,  a <> n -> nb_occ a (n :: l) = nb_occ a l.
Proof.
  intros; cbn.
  destruct (eq_dec n a); [congruence | reflexivity].
Qed.

Lemma nb_occ_app : forall n l1 l2,  nb_occ n (l1 ++ l2) = nb_occ n l1 + nb_occ n l2.
Proof.
  induction l1; [reflexivity |].
  intros; change ((a :: l1) ++ l2) with (a :: l1 ++ l2).
  destruct (eq_dec n a).
  - rewrite !nb_occ_cons by assumption.
    rewrite IHl1; reflexivity.
  - rewrite !nb_occ_cons_neq by assumption.
    apply IHl1.
Qed.

Lemma nb_occ_In : forall n l, In n l <-> nb_occ n l > 0.
Admitted.


Lemma nb_occ_partition_le_fst : forall l a n,  a <= n -> nb_occ a l =
                                      nb_occ a (fst (partition n l)).
Admitted.

Lemma nb_occ_partition_le_snd : forall l a n,  a <= n -> nb_occ a (snd (partition n l)) = 0.
Admitted.
 
Lemma nb_occ_partition_gt_fst : forall l a n,  a > n -> 
                                            nb_occ a (fst (partition n l)) = 0.
Admitted.



Lemma nb_occ_partition_gt_snd : forall l a n,  a > n -> nb_occ a l =
                                      nb_occ a (snd (partition n l)).
Admitted.

  Lemma nb_occ_partition' : forall l a n , nb_occ a l =
                                      nb_occ a (fst (partition n l))  + nb_occ a (snd (partition n l)).
Admitted.


  Lemma nb_occ_partition : forall l a n , nb_occ a (n :: l) =
                                       nb_occ a (fst (partition n l)) + (nb_occ a [n] + nb_occ a (snd (partition n l))).
  Admitted.

  (* a list is a permutation of another one if any given element has the same number of occurences in both lists *)
 Definition permut(l1 l2: list nat) := forall n, nb_occ n l1 = nb_occ n l2.


Lemma permut_In : forall n l1 l2, In n l2 -> permut l1 l2 -> In n l1.
Admitted.


 Lemma permut_nil_nil : permut [] [].
Admitted.



Lemma sorted_concat' : forall l1 l2 n,
    sorted l1 -> sorted l2 ->
    (forall m, In m l1 -> m <= n) ->
    (forall m, In m l2 -> n <  m) ->
    sorted (l1 ++ [n] ++ l2).
Admitted.

Lemma sorted_concat : forall l l1 l2 n,
  sorted l1 -> sorted l2 ->
    permut (fst (partition n l)) l1 ->
    permut (snd (partition n l)) l2 ->
    sorted (l1 ++ [n] ++ l2).
Admitted.

 Lemma permut_concat : forall l l1 l2 n,
    permut (fst (partition n l)) l1 ->
    permut (snd (partition n l)) l2 ->
    permut(n::l)  (l1 ++ [n] ++ l2).
 Admitted.
