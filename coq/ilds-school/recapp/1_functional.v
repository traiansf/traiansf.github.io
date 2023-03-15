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

(* Define a datatype 'point' representing points on the grid. This *)
(* type should be a record type with two fields. Use the type Z that *)
(*has been loaded with the 'ZArith' library to represent coordinates. *)

(* Define a point called 'point_0' which represented the origin of the *)
(*grid. *)

(* Define a datatype 'route' which models a trajectory on the grid as a list *)
(* of 'direction's *)

(* Define a function move : Point -> route -> Point that returns the *)
(*point of the grid reached after moving along its second argument *)
(* (r : route), starting from its first argument (p : point) *)

(* We use the convention that going North is increasing the Y *)
(* coordinate and East is increasing the X coordinate *)

(* Z.eqb is a boolean equality test on Z *)
Print Z.eqb.

(* Define a function route_eqb : route -> route -> bool which tests *)
(* whether two routes end at the same position when starting from the *)
(* point point_0 *)














 


  


