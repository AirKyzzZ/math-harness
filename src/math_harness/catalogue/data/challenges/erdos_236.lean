import Mathlib

open Filter Asymptotics

namespace Erdos236

def f (n : ℕ) : ℕ :=
  ((List.range (Nat.log2 n + 1)).filter (fun k => Nat.Prime (n - 2^k))).length

theorem erdos_236 :
    (fun n => (f n : ℝ)) =o[atTop] (fun n => Real.log (n : ℝ)) := by
  sorry

end Erdos236
