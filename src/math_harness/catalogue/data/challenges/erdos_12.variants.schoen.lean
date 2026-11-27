import Mathlib

open Filter Set

namespace Erdos12

abbrev IsGood (A : Set ℕ) : Prop := A.Infinite ∧
  ∀ᵉ (a ∈ A) (b ∈ A) (c ∈ A), a ∣ b + c → a < b →
  a < c → b = c

open Erdos12

theorem erdos_12.variants.schoen (A : Set ℕ) (hA : IsGood A) (hA' : A.Pairwise Nat.Coprime) :
    ∃ C > (0 : ℝ), {N : ℕ | (A ∩ Icc 1 N).ncard ≤ C * (N : ℝ) ^ (2 / 3 : ℝ)}.Infinite := by
  sorry

end Erdos12
