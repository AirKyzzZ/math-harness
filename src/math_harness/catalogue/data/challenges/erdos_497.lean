import Mathlib

open Filter

namespace Erdos497

theorem erdos_497 :
    ∃ (o : ℕ → ℝ) (_ : o =o[atTop] (1 : ℕ → ℝ)), ∀ n : ℕ, (DedekindNumber.M' n : ℝ) = 2 ^ ((1 + o n) * (n.choose (n / 2) : ℝ)) := by
  sorry

end Erdos497
