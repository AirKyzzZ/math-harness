import Mathlib

open Filter Set

namespace Erdos12

abbrev IsGood (A : Set ℕ) : Prop := A.Infinite ∧
  ∀ᵉ (a ∈ A) (b ∈ A) (c ∈ A), a ∣ b + c → a < b →
  a < c → b = c

open Erdos12

theorem erdos_12.parts.iii :
    ∀ (A : Set ℕ), IsGood A → Summable (fun (n : A) ↦ (1 / n : ℝ)) := by
  sorry

end Erdos12
