import Mathlib

open Filter Set

namespace Erdos12

abbrev IsGood (A : Set ℕ) : Prop := A.Infinite ∧
  ∀ᵉ (a ∈ A) (b ∈ A) (c ∈ A), a ∣ b + c → a < b →
  a < c → b = c

open Erdos12

theorem erdos_12.variants.erdos_sarkozy (f : ℕ → ℕ) (hf : atTop.Tendsto f atTop) :
    ∃ A, IsGood A ∧ {N : ℕ | (N : ℝ) / f N < (A ∩ Icc 1 N).ncard}.Infinite := by
  sorry

end Erdos12
