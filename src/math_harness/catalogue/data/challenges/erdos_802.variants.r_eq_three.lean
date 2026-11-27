import Mathlib

open Real

namespace Erdos802

open scoped Classical in
theorem erdos_802.variants.r_eq_three :
    ∃ c > (0 : ℝ), ∀ n : ℕ, ∀ G : SimpleGraph (Fin n), G.CliqueFree 3 → c * (log G.averageDegree / G.averageDegree) * n ≤ G.indepNum := by
  sorry

end Erdos802
