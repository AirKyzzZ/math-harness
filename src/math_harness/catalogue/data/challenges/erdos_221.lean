import Mathlib

open Filter Asymptotics

namespace Erdos221

theorem erdos_221 :
    ∃ A : Set ℕ, ((fun N => ({a ∈ A | a ≤ N}.ncard : ℝ)) ≪ (fun N => (N : ℝ) / Real.log N)) ∧ ∀ᶠ N in atTop, ∃ k a, 0 ≤ k ∧ a ∈ A ∧ N = 2 ^ k + a := by
  sorry

end Erdos221
