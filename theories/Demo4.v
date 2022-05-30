Fixpoint factorial (n : nat) :=
  match n with
  | O => 1
  | S n' => n * factorial n'
  end.

From CW Require Loader.
Require Extraction.

CWStopOnFailure 0.

Extract Constant mult => "Num.mult_num".
Extract Inductive nat => "Num.num"
  [ "(Num.Int 0)" "Num.succ_num" ]
  "(fun zero succ n -> if Num.sign_num n = 0 then zero () else succ (Num.pred_num n))".
Extraction "factorial.ml" factorial.
CWCompileAndRun "nums.cma" "factorial.mli" "factorial.ml" Options Driver " 
open Factorial
open Num
let () = assert (Int 0 = Int 0)
".
