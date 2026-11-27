import Mathlib

namespace Erdos1187

theorem erdos_1187.parts.i :
    ∀ k : ℕ, 3 ≤ k → ∀ (κ : Type) [Finite κ] (c : ℤ → κ), ∃ S : Set ℤ, S.IsAPOfLength k ∧ (∀ n ∈ S, ∃ p : ℕ, p.Prime ∧ (p : ℤ) = n) ∧ ∃ γ : κ, ∀ n ∈ S, c n = γ := by
  sorry

end Erdos1187
