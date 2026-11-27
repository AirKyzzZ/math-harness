import Mathlib

open Filter SimpleGraph

namespace Erdos86

theorem erdos_86_neg :
    ¬ (∀ ε : ℝ, 0 < ε → ∀ᶠ n : ℕ in atTop, ∀ H : SimpleGraph (Fin n → Bool), H ≤ hypercube n → (1 / 2 + ε) * n * 2 ^ (n - 1 : ℕ) ≤ (H.edgeSet.ncard : ℝ) → cycleGraph 4 ⊑ H) := by
  sorry

end Erdos86
