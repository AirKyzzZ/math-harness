import Mathlib

open Filter Real SimpleGraph

namespace Erdos559

open scoped Classical in
theorem erdos_559.variants.tikhomirov :
    ∃ c > 0, ∃ C > 0, ∃ᶠ n : ℕ in atTop, ∃ G : SimpleGraph (Fin n), G.maxDegree ≤ 3 ∧ C * n * exp (c * √(log n)) ≤ sizeRamsey G G := by
  sorry

end Erdos559
