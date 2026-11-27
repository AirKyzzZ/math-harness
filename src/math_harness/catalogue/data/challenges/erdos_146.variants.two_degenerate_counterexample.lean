import Mathlib

open Filter SimpleGraph

namespace Erdos146

theorem erdos_146.variants.two_degenerate_counterexample :
    ∃ (q : ℕ) (H : SimpleGraph (Fin q)), H.Connected ∧ H.IsBipartite ∧ H.IsDegenerate 2 ∧ ∃ c ε : ℝ, 0 < c ∧ 0 < ε ∧ ∀ᶠ n : ℕ in atTop, c * (n : ℝ) ^ ((3 : ℝ) / 2 + ε) ≤ (extremalNumber n H : ℝ) := by
  sorry

end Erdos146
