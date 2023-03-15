(* quicksort, all in one file *)
(* the quicksort function is at the end *)
Require Import List.
Require Import Lia.
Require Import Program.
Require Import Compare_dec.
Require Import PeanoNat.
Import Nat.
Import ListNotations.

Fixpoint filter(n:nat)(l:list nat) : (list nat * list nat) :=
  match l with
  | [] => ([],[])
  | a :: l' =>   let(l1,l2) := filter n l' in
                     match (le_lt_dec  a n) with
                     | left _ => (a::l1,l2)
                     |right _ => (l1, a::l2)
                     end
   end.                    


Lemma filter_fst_le_cons : forall a n l,  a <= n -> fst( filter n (a :: l))  = a :: (fst (filter n l)).
Proof.
  intros.
  simpl.
  destruct le_lt_dec; try lia.
  destruct (filter n l); reflexivity. 
Qed.

Lemma filter_snd_le_no_cons : forall a n l,  a <= n -> snd( filter n (a:: l))  = snd (filter n l).
  Proof.
  intros.
  simpl.
  destruct le_lt_dec; try lia.
  destruct (filter n l); reflexivity. 
Qed.

Lemma filter_fst_gt_no_cons : forall a n l,  a > n -> fst( filter n (a :: l))  = fst (filter n l).
Proof.
  intros.
  simpl.
  destruct le_lt_dec; try lia.
  destruct (filter n l); reflexivity. 
Qed.

Lemma filter_snd_gt_cons : forall a n l,  a > n -> snd( filter n (a :: l))  = a :: snd (filter n l).
Proof.
  intros.
  simpl.
  destruct le_lt_dec; try lia.
  destruct (filter n l); reflexivity. 
Qed.

Lemma  filter_fst_le : forall l n m,  In m (fst (filter n l)) -> m <= n .
  Proof.
induction l.
*  simpl ; intros ; destruct H.
* intros.
  destruct (le_gt_dec a n).
  + rewrite filter_fst_le_cons in H ; auto.
     inversion H ; subst; auto with arith.
  + rewrite  filter_fst_gt_no_cons in H; auto.
  Qed.

  
 Lemma filter_snd_gt : forall n m l,  In m (snd (filter n l)) -> n  < m .
   Proof.
  induction l.
*  simpl ; intros ; destruct H.
* intros.
  destruct (le_gt_dec  a n).
  + rewrite filter_snd_le_no_cons in H ; auto.
  + rewrite  filter_snd_gt_cons in H; auto.
    inversion H ; subst; auto with arith.
  Qed.

Lemma  filter_left_shorter : forall l n, length( fst (filter n l))  < length (n::l).
Proof.
  induction l ; intros.
  * auto with arith.
  *  destruct (le_gt_dec a n).
  +   rewrite filter_fst_le_cons; auto.
      replace (length   (n :: a :: l)) with (S (length (n :: l))).
      - replace ( length (a :: fst (filter n l))) with (S (length (fst (filter n l)))).                                       
        ** auto with arith.
        **   reflexivity.
      -  reflexivity.
 + rewrite filter_fst_gt_no_cons; auto.
     specialize (IHl n) ; simpl in *; auto with arith. 
Qed.

Lemma filter_right_shorter : forall l n, length( snd (filter  n l))  < length (n :: l).
Proof.
  induction l ; intros.
  * auto with arith.
  *  destruct (le_gt_dec a n).
  + rewrite filter_snd_le_no_cons; auto.
     specialize (IHl n) ; simpl in *; auto with arith. 

 +   rewrite filter_snd_gt_cons; auto.
      replace (length   (n :: a :: l)) with (S (length (n :: l))).
      - replace ( length (a :: snd (filter n l))) with (S (length (snd (filter n l)))).                                       
        ** auto with arith.
        **   reflexivity.
      -  reflexivity.
Qed.


Inductive  sorted : list nat->  Prop :=
|sorted_nil : sorted []
|sorted_single : forall n, sorted [n]
|sorted_cons : forall l1 l2,  sorted l1 -> sorted l2 ->
  (forall x y, In x l1 -> In y l2 -> x <= y) -> sorted (l1 ++ l2).


Fixpoint nb_occ n l  :=
  match l with
  | [] => 0
  | a :: l' =>
    match (PeanoNat.Nat.eq_dec a n) with
    |left _ => S (nb_occ n l')
    |right _ => nb_occ n l'
    end
end.      

Lemma nb_occ_cons : forall n l,  nb_occ n (n :: l) = S (nb_occ n l).
Proof.
intros.
simpl.
destruct PeanoNat.Nat.eq_dec ; lia.
Qed.

Lemma nb_occ_cons_neq : forall a n l,  a <> n -> nb_occ a (n :: l) = nb_occ a l.
Proof.
intros.
simpl.
destruct PeanoNat.Nat.eq_dec ; subst; lia.
Qed.

Lemma nb_occ_app : forall n l1 l2,  nb_occ n (l1 ++ l2) = nb_occ n l1 + nb_occ n l2.
Proof.
intros.
induction l1.
* simpl ; reflexivity.
* case (PeanoNat.Nat.eq_dec a n) ; intros; subst.
  -  rewrite nb_occ_cons.
   +  replace (S (nb_occ n l1) + nb_occ n l2) with (S (nb_occ n l1 + nb_occ n l2)) ; auto with arith.
      rewrite <- IHl1.
      rewrite <- nb_occ_cons ; reflexivity.
 -  rewrite nb_occ_cons_neq ; auto.
    rewrite <- IHl1.
    replace ((a :: l1) ++ l2)with (a :: l1 ++ l2).
    +  rewrite  nb_occ_cons_neq with  n a (l1 ++ l2) ; auto.
    +  reflexivity. 
Qed.

    Lemma nb_occ_In : forall n l, In n l <-> nb_occ n l > 0.
Proof.
  split ; intros.
  induction l.  
  * inversion H.
  *  inversion H ; subst.
     rewrite nb_occ_cons; auto with arith.
     destruct (PeanoNat.Nat.eq_dec a n) ; intros; subst.
    - rewrite nb_occ_cons ; auto with arith.     
    - rewrite nb_occ_cons_neq; auto.
  * induction l.
     - simpl in *;  lia.
     - destruct (PeanoNat.Nat.eq_dec a n) ; intros; subst.
       + constructor; reflexivity.
       +  constructor 2.
          apply IHl.
          erewrite <- nb_occ_cons_neq ; eauto.
Qed.


Lemma nb_occ_filter_le_fst : forall l a n,  a <= n -> nb_occ a l =
                                      nb_occ a (fst (filter n l)).
Proof.
  induction l ; intros.
* reflexivity.
* destruct (le_gt_dec a n).
  + rewrite filter_fst_le_cons; auto.
    destruct (PeanoNat.Nat.eq_dec a a0) ; subst.
    - do 2 rewrite nb_occ_cons.
       erewrite IHl ; eauto.
    -   do 2 ( rewrite nb_occ_cons_neq ; auto).
+ rewrite filter_fst_gt_no_cons; auto.
    destruct (PeanoNat.Nat.eq_dec a a0) ; subst.
    - lia.
    -   do 2 ( rewrite nb_occ_cons_neq ; auto).
Qed.

Lemma nb_occ_filter_le_snd : forall l a n,  a <= n -> nb_occ a (snd (filter n l)) = 0.
Proof.
 induction l ; intros.
* reflexivity.
* destruct (le_gt_dec a n).
  + rewrite filter_snd_le_no_cons; auto.
 +  rewrite filter_snd_gt_cons; auto.
    destruct (eq_dec a a0) ; subst; try lia.
    rewrite nb_occ_cons_neq ; auto.
Qed.
 
Lemma nb_occ_filter_gt_fst : forall l a n,  a > n -> 
                                            nb_occ a (fst (filter n l)) = 0.
  Proof.
 induction l ; intros.
* reflexivity.
* destruct (le_gt_dec a n).
 + rewrite filter_fst_le_cons; auto.
   destruct (eq_dec a a0) ; subst; try lia.
   rewrite nb_occ_cons_neq ; auto.
  +  rewrite filter_fst_gt_no_cons; auto.
Qed. 



Lemma nb_occ_filter_gt_snd : forall l a n,  a > n -> nb_occ a l =
                                      nb_occ a (snd (filter n l)).
 induction l ; intros.
* reflexivity.
* destruct (le_gt_dec a n).
  + rewrite filter_snd_le_no_cons; auto.
    destruct (eq_dec a a0) ; subst; try lia.
    do 2 (rewrite nb_occ_cons_neq; auto).
 +  rewrite  filter_snd_gt_cons; auto.
    destruct (eq_dec a a0) ; subst.
    - do 2 ( rewrite nb_occ_cons ; auto).
    - do 2 (rewrite nb_occ_cons_neq; auto).   
Qed.

Lemma nb_occ_filter' : forall l a n , nb_occ a l =
                                      nb_occ a (fst (filter n l))  + nb_occ a (snd (filter n l)).
Proof.
intros.
destruct (le_gt_dec a n).
* rewrite <- nb_occ_filter_le_fst; auto.
  rewrite nb_occ_filter_le_snd ; auto.
*   rewrite nb_occ_filter_gt_fst; auto.
    rewrite <- nb_occ_filter_gt_snd  ; auto.
Qed. 


  Lemma nb_occ_filter : forall l a n , nb_occ a (n :: l) =
                                     nb_occ a (fst (filter n l)) + (nb_occ a [n] + nb_occ a (snd (filter n l))).                                                                                       
Proof.
intros.
erewrite (nb_occ_filter' _ a n).
replace (fst (filter n (n :: l))) with (n :: (fst (filter n l))).
* replace (snd (filter n (n :: l))) with (snd (filter n l)).
   +simpl.
     destruct Nat.eq_dec; lia.
   + rewrite filter_snd_le_no_cons ;auto with arith.
 *  rewrite filter_fst_le_cons ; auto with arith.
Qed.
 
 Definition permut(l1 l2: list nat) := forall n, nb_occ n l1 = nb_occ n l2.


Lemma permut_In : forall n l1 l2, In n l2 -> permut l1 l2 -> In n l1.
Proof.
  intros.
  rewrite nb_occ_In in *.
  rewrite H0; auto.
Qed.


 Lemma permut_nil_nil : permut [] [].
Proof.
  unfold permut ; intros ; simpl ;  reflexivity.
Qed.  



Lemma sorted_concat' : forall l1 l2 n,
    sorted l1 -> sorted l2 ->
    (forall m, In m l1 -> m <= n) ->
    (forall m, In m l2 -> n <  m) ->
    sorted (l1 ++ [n] ++ l2).
Proof.
  intros.
  constructor  3; auto.
  * constructor 3 ;auto.
   + constructor 2.
   + simpl ; intros ; subst.
     destruct H3 ; intuition ; subst.
     specialize  (H2 _ H4) ; auto with arith.
 * intros.
   inversion H4  ; subst.
   + apply H1; auto.
   + simpl in *.
     specialize (H1 _ H3).
     specialize (H2 _ H5).
     eauto with arith.
Qed.


Lemma sorted_concat : forall l l1 l2 n,
  sorted l1 -> sorted l2 ->
    permut (fst (filter n l)) l1 ->
    permut (snd (filter n l)) l2 ->
    sorted (l1 ++ [n] ++ l2).
Proof.
intros.
apply sorted_concat' ; auto ; intros.
*
  generalize (permut_In _ _ _ H3 H1).
  apply filter_fst_le.      
*
  generalize (permut_In _ _ _ H3 H2).
  apply filter_snd_gt.      
Qed.

 Lemma permut_concat : forall l l1 l2 n,
    permut (fst (filter n l)) l1 ->
    permut (snd (filter n l)) l2 ->
    permut(n::l)  (l1 ++ [n] ++ l2).
 Proof.
   intros.
   unfold permut in * ; intros a.
   do 2 rewrite nb_occ_app.
   rewrite <- H.
   rewrite <- H0.  
   rewrite nb_occ_filter ; auto.
Qed.


 Program Fixpoint quicksort(l : list nat){measure (length l)} : {l' : list nat | sorted l' /\ permut l l'}  := _.
Next Obligation.
 destruct l.
  * exists [].
      split.
      - apply sorted_nil.
      - apply permut_nil_nil.
   * 
     destruct (quicksort _ (filter_left_shorter l n)) as [l1 [Hl1sorted Hl1permut]].
     destruct (quicksort _ (filter_right_shorter l n)) as [l2 [Hl2sorted Hl2permut]].
     exists (l1 ++ [n] ++ l2).
     split.      
      - apply sorted_concat with l ; auto.
      -  apply permut_concat ; auto.
  
Defined.

Extraction Inline quicksort_obligation_1.
Recursive Extraction quicksort.

Compute proj1_sig (quicksort [0  ; 3 ; 2 ; 1]).
