Require Import List.
Require Import Omega.
Require Import Program.
(* Require Import here your compiled file containing the approprizae lemmas on lists*)
Import ListNotations.


(* then uncomment this and complete the definitioin 
 Program Fixpoint quicksort(l : list nat){measure (length l)} : {l' : list nat | sorted l' /\ permut l l'}  := _.
Next Obligation.
Admitted.

Extraction Inline quicksort_obligation_1.
Recursive Extraction quicksort.

Compute proj1_sig (quicksort [3 ; 2 ; 1]).
*)