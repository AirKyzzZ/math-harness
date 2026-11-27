import Mathlib

open Filter Real Finset

open scoped ENNReal

namespace Erdos839

def SumOfConsecutiveFree (a : ℕ → ℕ) : Prop :=
  ∀ i : ℕ, ∀ j k : ℕ, j ≤ k → k < i →
    a i ≠ ∑ l ∈ Finset.Icc j k, a l

theorem erdos_839.parts.i :
    ∀ (a : ℕ → ℕ), (∀ n, 1 ≤ a n) → StrictMono a → SumOfConsecutiveFree a → atTop.limsup (fun n : ℕ => (a n : ℝ≥0∞) / n) = ⊤ := by
  sorry

-- TODO: Formalize the additional material on the possible lower limit, reciprocal-sum growth,

-- upper-density constructions, and the links with Erdős Problems 359 and 867.

end Erdos839
