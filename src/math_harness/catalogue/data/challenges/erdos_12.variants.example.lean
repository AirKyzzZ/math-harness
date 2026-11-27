import Mathlib

open Filter Set

namespace Erdos12

abbrev IsGood (A : Set ℕ) : Prop := A.Infinite ∧
  ∀ᵉ (a ∈ A) (b ∈ A) (c ∈ A), a ∣ b + c → a < b →
  a < c → b = c

open Erdos12

theorem erdos_12.variants.example (A : Set ℕ) (hA : A = {p ^ 2 | (p : ℕ) (_ : p.Prime) (_ : p ≡ 3 [MOD 4])}) :
    IsGood A ∧ 0 < atTop.liminf (fun (N : ℕ) ↦ (A ∩ Icc 1 N).ncard * (N : ℝ).log / √N) := by
  sorry

end Erdos12
