import Mathlib

open scoped Nat Asymptotics

open Filter

namespace Erdos912

noncomputable def h (n : ℕ) : ℕ := (n !).factorization.frange.card

theorem erdos_912.variants.tao :
    (fun n => (h n : ℝ)) ~[atTop] (fun n => √(2 * Real.pi) * (n / Real.log n) ^ (1 / 2 : ℝ)) := by
  sorry

end Erdos912
