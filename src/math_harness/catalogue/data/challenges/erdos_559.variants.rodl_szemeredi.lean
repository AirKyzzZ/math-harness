import Mathlib

open Filter Real SimpleGraph

namespace Erdos559

open scoped Classical in
theorem erdos_559.variants.rodl_szemeredi :
    ∃ c > (0 : ℝ), ∃ C > 0, ∃ᶠ n : ℕ in atTop, ∃ G : SimpleGraph (Fin n), G.maxDegree ≤ 3 ∧ C * n * (log n) ^ c ≤ sizeRamsey G G := by
  sorry

end Erdos559
