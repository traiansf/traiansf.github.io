Require Import List  ZArith  Bool.

(* Recall this is the type of polymorphic lists *)
Print list.

(* We have some boolean operations at hand *)
Print andb.
Print xorb.

(* This command sets the default interpretation of some notations like *)
(*'0', '+', ... *)
Open Scope Z_scope.

Check 0.
Check (0 + 1).

(* In this exercise, we model a two-dimensional grid, with *)
(* integer coordinates. We define moves on this grid and some *)
(*properties on such routes. *)


(* Define a datatype 'direction' representing the four cardinal points :
  north, east, south and west. This type should be an enumerated type *)

Inductive direction := North | South | West | East.

(* Define a datatype 'point' representing points on the grid. This *)
(* type should be a record type with two fields. Use the type Z that *)
(*has been loaded with the 'ZArith' library to represent coordinates. *)

Record point := mkPoint
{Xcoord : Z;
 Ycoord : Z}.

(* Define a point called 'point_0' which represented the origin of the *)
(*grid. *)

Definition point_0 := mkPoint 0 0.

(* Define a datatype 'route' which models a trajectory on the grid as a list *)
(* of 'direction's *)

Definition route := list direction.

(* Define a function move : Point -> route -> Point that returns the *)
(*point of the grid reached after moving along its second argument *)
(* (r : route), starting from its first argument (p : point) *)

(* We use the convention that going North is increasing the Y *)
(* coordinate and East is inc creasing the X coordinate *)
Definition move_one (p : point) (d : direction) :=
  let xp := Xcoord p in
  let yp := Ycoord p in
  match d with
    |North => mkPoint xp (yp + 1) 
    |South => mkPoint xp (yp - 1)
    |East => mkPoint (xp + 1) yp 
    |West => mkPoint (xp - 1) yp
  end.

Fixpoint move (p : point) (r : route) :=
  match r with
    |nil => p
    |d :: l =>  move (move_one p d) l
  end.

(* Z.eqb is a boolean equality test on Z *)
Print Z.eqb.

(* Define a function route_eqb : route -> route -> bool which tests *)
(* whether two routes end at the same position when starting from the *)
(* point point_0 *)

Definition point_eqb (p1 p2 : point) :=
  andb (Z.eqb (Xcoord p1) (Xcoord p2))
       (Z.eqb (Ycoord p1) (Ycoord p2)).

Definition route_eqb (r1 r2 : route) :=
  point_eqb (move point_0 r1) (move point_0 r2).
 













 


  


