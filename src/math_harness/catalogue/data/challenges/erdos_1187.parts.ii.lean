import Mathlib

namespace Erdos1187

theorem erdos_1187.parts.ii :
    ¬ ∀ k : ℕ, 3 ≤ k → ∀ (κ : Type) [Finite κ] (c : ℤ → κ), ∃ (a : ℤ) (p : ℕ) (S : Set ℤ), p.Prime ∧ S.IsAPOfLengthWith k a p ∧ ∃ γ : κ, ∀ n ∈ S, c n = γ := by
  sorry

end Erdos1187
