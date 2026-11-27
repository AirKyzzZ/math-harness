import Mathlib

open Filter Real SimpleGraph

namespace Erdos559

open scoped Classical in
theorem erdos_559.variants.draganic_petrova (ε : ℝ) (hε : 0 < ε) :
    ∀ᶠ n : ℕ in atTop, ∀ G : SimpleGraph (Fin n), G.maxDegree ≤ 3 → (sizeRamsey G G : ℝ) ≤ (n : ℝ) ^ (3 / 2 + ε : ℝ) := by
  sorry

end Erdos559
