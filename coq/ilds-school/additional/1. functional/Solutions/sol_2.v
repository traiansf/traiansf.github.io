(* write a function that takes two arguments of boolean type,
and returns true only when the first one is true and the second is
false. *)

Definition ex1 (b1 b2 : bool) :=
  match b1, b2 with
    true, false => true
  | _, _ => false
  end.

(* write a function that takes four arguments of boolean type,
and returns true exactly when two of these arguments are true. *)

Definition ex2_aux2 (b2 b3 b4 : bool) :=
  match b2, b3, b4 with
    true, true, false => true
  | true, false, true => true
  | false, true, true => true
  | _, _, _ => false
  end.

Definition ex2_aux1 (b2 b3 b4 : bool) :=
  match b2, b3, b4 with
    false, false, true => true
  | false, true, false => true
  | true, false, false => true
  | _, _, _ => false
  end.

Definition ex2 (b1 b2 b3 b4 : bool) :=
  match b1 with
    true => ex2_aux1 b2 b3 b4
  | false => ex2_aux2 b2 b3 b4
  end.

Definition ex2' (b1 b2 b3 b4 : bool) :=
  let f := fun b : bool => if b then 1 else 0 in
  match f b1 + f b2 + f b3 + f b4 with
    2 => true
  | _ => false
  end.

Definition ex3 (b1 b2 : bool) :=
  match b1, b2 with
    true, true => true
  | false, false => true
  | _, _ => false
  end.

