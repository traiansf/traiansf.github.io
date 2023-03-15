(* write a function that takes two numbers as inputs and returns their sum *)

(* write a function that takes a pair of numbers as argument and returns a
  pair of numbers as results, where the first number is the sum of the
  two numbers in the input, and the second number is the first number in
  the input. Name this function f1 *)

Definition f1 (p : nat * nat) := let (x, y) := p in (x + y, x).



(* write a function that takes a function from pairs of numbers to
  pairs of number and a pair of numbers and repeats the function five
  times on the input pair. Name this function rep5.*)

Definition rep5 f (p : nat * nat) :=   f (f (f (f (f p)))).

Compute rep5 f1 (1,0).

(*
  Compute rep5 f1 (1, 0). Should return (8, 5)
 *)

(* write a function F2 hat takes two functions as arguments : the first one has 
the same type as f1, the second one has type  nat * nat -> nat * nat.
 F2 should apply the first  argument twice to the second argument
 *)


Definition F2 f (g : nat * nat -> nat * nat) :=  f (f g).

(* write a function that takes a pair of integers as arguments and
   returns a pair where: 
   -  the first component is the first input plus 1
   -  the second component is the first input

   Compute the value obtained by applying F2 to rep5 this function, and
   the pair 0, 0. *)





Compute F2 rep5 (fun p => let (x, y) := p in (x + 1, x)) (0, 0).
(* hint  : rep5 repeats five times, F2 rep5 repeates 5*5 times *)

(* Using the same approach, compute the 16th Fibonacci number. *)


(* apply F2 then not f5 but "f4"  to f1*)
Compute (fun f g => f (f g)) (fun f p => f (f (f (f p)))) f1 (1, 0).
