import Mathlib

open Filter

namespace Erdos853

noncomputable def r (x : ℕ) : ℕ :=
  sInf { t : ℕ | 0 < t ∧ t % 2 = 0 ∧ ¬ (∃ n ≤ x, primeGap n = t) }

theorem erdos_853.parts.i :
    atTop.Tendsto r atTop := by
  sorry

end Erdos853
