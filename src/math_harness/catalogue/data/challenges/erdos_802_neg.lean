import Mathlib

open Real

namespace Erdos802

open scoped Classical in
theorem erdos_802_neg :
    ¬ (∀ r : ℕ, ∃ c > (0 : ℝ), ∀ n : ℕ, ∀ G : SimpleGraph (Fin n), G.CliqueFree r → c * (log G.averageDegree / G.averageDegree) * n ≤ G.indepNum) := by
  sorry

end Erdos802
