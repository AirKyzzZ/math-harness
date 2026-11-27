import Mathlib

open Filter SimpleGraph

open scoped Finset

namespace Erdos666

theorem erdos_666_neg :
    ¬ (¬ ∀ ε : ℝ, 0 < ε → ∀ᶠ n : ℕ in atTop, ∀ H : SimpleGraph (Fin n → Bool), H ≤ hypercube n → ε * n * 2 ^ (n - 1 : ℕ) ≤ (H.edgeSet.ncard : ℝ) → (cycleGraph 6 ⊑ H)) := by
  sorry

end Erdos666
