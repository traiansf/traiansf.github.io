(* a sequence of exercices about lits and proofs by induction*)
(* will be reused a late exercice about the quicksot function*)
Require Import List Lia PeanoNat Compare_dec Program.
Import Nat ListNotations.

(*decomposing the list  l in two parts: elements <= n, elements > n *)
Fixpoint partition(n:nat)(l:list nat) : (list nat * list nat) :=
  match l with
  | [] => ([],[])
  | a :: l' =>   let(l1,l2) := partition n l' in
                     match (le_lt_dec  a n) with
                     | left _ => (a::l1,l2)
                     |right _ => (l1, a::l2)
                     end
   end.                    

(* a good practice is to write equality lemmas, to be used  for rewriting in subsequent proofs *)
Lemma partition_fst_le_cons : forall a n l,  a <= n -> fst( partition n (a :: l))  = a :: (fst (partition n l)).
Admitted.

Lemma partition_snd_le_no_cons : forall a n l,  a <= n -> snd( partition n (a:: l))  = snd (partition n l).
 Admitted.

Lemma partition_fst_gt_no_cons : forall a n l,  a > n -> fst( partition n (a :: l))  = fst (partition n l).
Admitted.

Lemma partition_snd_gt_cons : forall a n l,  a > n -> snd( partition n (a :: l))  = a :: snd (partition n l).
Admitted.

Lemma  partition_fst_le : forall l n m,  In m (fst (partition n l)) -> m <= n .
Admitted.

  
 Lemma partition_snd_gt : forall n m l,  In m (snd (partition n l)) -> n  < m .
 Admitted.

Lemma  partition_left_shorter : forall l n, length( fst (partition n l))  < length (n::l).
Admitted.

Lemma partition_right_shorter : forall l n, length( snd (partition  n l))  < length (n :: l).
Admitted.

(* an inductive relation defining sortedness of lists of naturals *)
Inductive  sorted : list nat->  Prop :=
|sorted_nil : sorted []
|sorted_single : forall n, sorted [n]
|sorted_app : forall l1 l2,  sorted l1 -> sorted l2 ->
  (forall x y, In x l1 -> In y l2 -> x <= y) -> sorted (l1 ++ l2).

(* number of occurences of an element in a list *)
Fixpoint nb_occ n l  :=
  match l with
  | [] => 0
  | a :: l' =>
    match (eq_nat_dec a n) with
    |left _ => S (nb_occ n l')
    |right _ => nb_occ n l'
    end
end.      

Lemma nb_occ_cons : forall n l,  nb_occ n (n :: l) = S (nb_occ n l).
Admitted.

Lemma nb_occ_cons_neq : forall a n l,  a <> n -> nb_occ a (n :: l) = nb_occ a l.
Admitted.

Lemma nb_occ_app : forall n l1 l2,  nb_occ n (l1 ++ l2) = nb_occ n l1 + nb_occ n l2.
Admitted.

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
