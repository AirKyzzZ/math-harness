import Mathlib

open Nat Filter

open scoped ArithmeticFunction ArithmeticFunction.sigma Topology

namespace Erdos955

def s (n : ℕ) : ℕ := σ 1 n - n

theorem s_one : s 1 = 0 := by decide

theorem s_two : s 2 = 1 := by decide

theorem s_six : s 6 = 6 := by decide

theorem s_twelve : s 12 = 16 := by decide

theorem s_twenty_eight : s 28 = 28 := by decide

theorem erdos_955.variants.troupe_unusually_many_prime_factors :
    ∀ ε > 0, { x | (1 + ε) * Real.log (Real.log (s x)) < (ArithmeticFunction.cardDistinctFactors (s x) : ℝ) }.HasDensity 0 := by
  sorry

end Erdos955
