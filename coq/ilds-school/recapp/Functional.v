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

Variant direction : Type :=
| north
| east
| south
| west.

(* Define a datatype 'point' representing points on the grid. This *)
(* type should be a record type with two fields. Use the type Z that *)
(*has been loaded with the 'ZArith' library to represent coordinates. *)

Record point : Type := MkPoint
{
  x_axis : Z ;
  y_axis : Z ;
}.

(* Define a point called 'point_0' which represented the origin of the *)
(*grid. *)

Definition point_0 : point := {| x_axis := 0; y_axis := 0 |}.

(* Define a datatype 'route' which models a trajectory on the grid as a list *)
(* of 'direction's *)

Record route : Type := mkRoute { getRoute : list direction }.

(* Define a function move : Point -> route -> Point that returns the *)
(*point of the grid reached after moving along its second argument *)
(* (r : route), starting from its first argument (p : point) *)

Definition move_direction (p : point) (d : direction) : point :=
  match d with
  | north => {| x_axis := x_axis p; y_axis := 1 + y_axis p |}
  | south => {| x_axis := x_axis p; y_axis := -1 + y_axis p |}
  | east => {| x_axis := 1 + x_axis p; y_axis := y_axis p |}
  | west => {| x_axis := -1 + x_axis p; y_axis := y_axis p |}
  end.

Definition move (p : point) (r : route) : point :=
  fold_left move_direction (getRoute r) p.

(* We use the convention that going North is increasing the Y *)
(* coordinate and East is increasing the X coordinate *)

(* Z.eqb is a boolean equality test on Z *)
Print Z.eqb.

(* Define a function route_eqb : route -> route -> bool which tests *)
(* whether two routes end at the same position when starting from the *)
(* point point_0 *)

Definition point_eqb (p1 p2 : point) : bool :=
  andb (Z.eqb (x_axis p1) (x_axis p2)) (Z.eqb (y_axis p1) (y_axis p2)).

Definition route_eqb (r1 r2 : route) : bool :=
  point_eqb (move point_0 r1) (move point_0 r2).
