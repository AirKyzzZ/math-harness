import Mathlib

open Real

namespace Erdos802

open scoped Classical in
theorem erdos_802.variants.shearer :
    ∀ r : ℕ, ∃ c > (0 : ℝ), ∀ n : ℕ, ∀ G : SimpleGraph (Fin n), G.CliqueFree r → 2 ≤ G.averageDegree → c * (log G.averageDegree / (log (log (G.averageDegree + 1)) * G.averageDegree)) * n ≤ G.indepNum := by
  sorry

end Erdos802
