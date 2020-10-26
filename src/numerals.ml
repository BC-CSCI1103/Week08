
(* file: numerals.ml
   author: Bob Muller

   CSCI 1103 Computer Science 1 Honors
*)

(* div : int -> int -> int * int

   The call (div m n) returns the quotient and remainder.
*)
let div m n = (m / n, m mod n)

(* addDigits : int -> int -> int -> int * int

   This is a helper function for the add function.
   The call (addDigits m n carryIn) returns the sum
   digit and the carry digit of a one-digit slice of
   positional addition.
*)
let addDigits m n carryIn base =
  let sum = m + n + carryIn
  in
  div sum base

(* add : int list -> int list -> int -> int list

   The call (add ms ns base) returns the result of
   positional addition of digits ms and ns with the
   given base.
*)
let add ms ns base =
  let rec repeat ms ns carryIn answer =
    match (ms, ns) with
    | ([], []) -> answer
    | (_, []) | ([], _) -> failwith "add: unequal lengths of digits"
    | (m :: ms, n :: ns) ->
      let (carryOut, sum) = addDigits m n carryIn base
      in
      repeat ms ns carryOut (sum :: answer)
  in
  repeat (List.rev ms) (List.rev ns) 0 []
