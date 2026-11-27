import Mathlib

namespace Erdos1075

open Filter Asymptotics

theorem erdos_1075 :
    ∀ r : ℕ, 3 ≤ r → ∃ c : ℝ, (r : ℝ)⁻¹ ^ r < c ∧ ∀ ε : ℝ, 0 < ε → ∃ m : ℕ → ℕ, Tendsto m atTop atTop ∧ ∀ᶠ n : ℕ in atTop, ∀ H : Finset (Finset (Fin n)), H.IsUniform r → (1 + ε) * ((n : ℝ) / r) ^ r ≤ H.card → ∃ S : Finset (Fin n), S.card = m n ∧ c * (S.card : ℝ) ^ r ≤ (H.hypergraphInduce S).card := by
  sorry

end Erdos1075
