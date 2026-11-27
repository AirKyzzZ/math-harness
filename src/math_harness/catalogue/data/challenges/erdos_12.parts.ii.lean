import Mathlib

open Filter Set

namespace Erdos12

abbrev IsGood (A : Set ℕ) : Prop := A.Infinite ∧
  ∀ᵉ (a ∈ A) (b ∈ A) (c ∈ A), a ∣ b + c → a < b →
  a < c → b = c

open Erdos12

theorem erdos_12.parts.ii :
    ¬ ∃ c > (0 : ℝ), ∀ (A : Set ℕ), IsGood A → {N : ℕ| (A ∩ Icc 1 N).ncard < (N : ℝ) ^ (1 - c)}.Infinite := by
  sorry

end Erdos12
