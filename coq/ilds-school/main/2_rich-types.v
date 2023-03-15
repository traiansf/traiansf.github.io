Require Import Omega.



(* Coq's type system is expressive enough to encode, e.g.,  what a function computes, in the function's own type*)
(*in this series of exercices you will explore and use some of this expressiveness *)



(* "Subset" type.  From standard library:  sig A P, the type of "elements" of type A that satisfy a predicate P :*)
(*
Inductive sig (A:Type)(P:A -> Prop) : Type :=
  exist : forall  x:A, P x -> sig A P.
(* the "inhabitants" of the type sig A P are pairs, built with the constructor "exist", of some x  type A *and* a proof that P x holds *)

Arguments sig [A].

Notation "{ x | P }" := (sig (fun x => P)) : type_scope.
 *)

(*Please do not forget to comment out the above definition and notation - they already exist, so no need to duplicate them*)

(*Fortunately, the above Coq notation enables familiar set-like mathematical notation. *)

(*Example:  the type of natural numbers less than 3 is written  in set-like notation: {x | x < 3}. *)

(*However, despite superficial resemblances induced by notations,  {x | x < 3} is *not* a set.  *)

(*To see why {x | x < 3} is *not* a set (of natural numbers),  bear in mind that an "element of"  {x | x < 3}. is a pair ,
 consisting of a natural number, and a proof that the number in question ls less-than 3 *)

(* Since we need it, here's a proof that 1 < 3 *)
Lemma one_lt_three : 1 < 3.
Proof.
  auto with arith.
Qed.  

(* and  here's  a  definition for the constant  called "rich_one", of "rich" type { x | x < 3}, *)
Definition rich_one : {  x  | x < 3} := exist _ 1  one_lt_three.
(* notice the mixture in rich_one of computational content (1) and logical content ( a proof that 1 < 3) *)

Print rich_one.


(*Since subset types in general are inhabited by pairs, *)
(*here is  a function extracting the first component of such a pair, using pattern matching.*)
  Definition extract (A:Type)(P:A ->Prop) (q : sig P)  :=
                  match q with
                    exist   _ x _ => x
                  end.
                                                        

(*make the first two arguments implicit, to avoid typing redundant information*)
Arguments  extract {_ _}.


(* verify that extract  of rich_one returns 1 by Compute *)
Compute extract rich_one.

(* prove the extract does extract a correct value *)
Lemma extract_extracts : forall (A:Type)(P:A -> Prop)(y:{x | P x}),
    P (extract  y).
Admitted.




(* use sigma types for precisely specifying functions: example of the predecessor function  *)
(* This is an example of program-by-proof script *)
(* Since we are defining a program, its proof script should end by Defined, not Qed.*)
Definition pred_rich (n : {m | m > 0}) :  {l:nat | S l = extract   n}.
Admitted.



Print pred_rich.

(*  Another version of the above. Also defined by proof, also closed by Defined.*)
Definition pred_rich' : forall n, n > 0 ->  {l:nat | S l = n}.
Admitted.

Print pred_rich'.
Require Extraction.
Extraction pred_rich'.
Extraction pred_rich.




(* sigT : computational version of sig. Also from lstandard ibrary. Only difference is that P is not a predicate)

Inductive sigT (A:Type)(P: A -> Type) : Type :=
existT : forall x:A, P x  -> sigT A P.
Arguments sigT [A].

Notation "{ x  & P }" := (sigT (fun x => P)) : type_scope.
*)


(* example with sig and sigT: we actuallly will program this in a forthcoming exercice *)
(* Let's leave this admitted, for now *)
Definition div_specified : forall a b:nat, 0 <  b ->  {q:nat &{r:nat | a = q*b + r /\ 0 <= r < b}}.
Admitted.






(*how to do case analysis depending on n = m or not ?*)

(*one can use a Boolean equality test *)

(* or use use a decidable equality test *)

Check eq_nat_dec.

(*
here is the code from the standard library

Inductive sumbool (A B:Prop) : Set :=
  | left : A -> {A} + {B}
  | right : B -> {A} + {B}
 where "{ A } + { B }" := (sumbool A B) : type_scope.
*)


(* now write a function that returns true if n = m and false otherwise *)
(* please use pattern-matching ove req_nat_dec n m  *)

Definition eq_of_diff(n m:nat): bool.
Admitted.
