import Mathlib

open Filter Set

namespace Erdos12

abbrev IsGood (A : Set ℕ) : Prop := A.Infinite ∧
  ∀ᵉ (a ∈ A) (b ∈ A) (c ∈ A), a ∣ b + c → a < b →
  a < c → b = c

open Erdos12

theorem erdos_12.variants.erdos_sarkozy_density_0 (A : Set ℕ) (hA : IsGood A) :
    A.HasDensity 0 := by
  sorry

end Erdos12
