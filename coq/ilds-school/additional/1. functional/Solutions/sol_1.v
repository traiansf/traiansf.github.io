(* write a function that takes two numbers as input and
  returns the square of the first one added to the double
  of the second one. *)

Inductive season :=
  Winter | Spring | Summer | Autumn.

Inductive color :=
  Green | Yellow | Red | Blue | White | Black.

(* write a function that takes a season as input, and returns
   the next season, chronologically. *)

Definition next_season s :=
  match s with
    Winter => Spring
  | Spring => Summer
  | Summer => Autumn
  | Autumn => Winter
  end.

(* write a function that takes a season and a color as input
  and returns true if and only if 
  their name has a vowel in common.
  Try to catch several cases at a time. *)

Definition common_vowel s c :=
  match s,c  with
    Winter, Black => false
  | Winter, _ => true
  | Spring, White => true
  | Spring, _ => false
  | Summer, Black => false
  | Summer, _ => true
  | Autumn, Blue => true
  | Autumn, Black => true
  | Autumn, _ => false
  end.
