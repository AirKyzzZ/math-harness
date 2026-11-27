import Mathlib

open Filter SimpleGraph

namespace Erdos714

theorem erdos_714 :
    ∀ r : ℕ, 2 ≤ r → ∃ c : ℝ, 0 < c ∧ ∀ᶠ n : ℕ in atTop, c * (n : ℝ) ^ ((2 : ℝ) - 1 / (r : ℝ)) ≤ (extremalNumber n (completeBipartiteGraph (Fin r) (Fin r)) : ℝ) := by
  sorry

end Erdos714
