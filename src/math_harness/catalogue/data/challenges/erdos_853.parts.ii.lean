import Mathlib

open Filter

namespace Erdos853

noncomputable def r (x : ℕ) : ℕ :=
  sInf { t : ℕ | 0 < t ∧ t % 2 = 0 ∧ ¬ (∃ n ≤ x, primeGap n = t) }

theorem erdos_853.parts.ii :
    atTop.Tendsto (fun n ↦ r n / Real.log n) atTop := by
  sorry

end Erdos853
