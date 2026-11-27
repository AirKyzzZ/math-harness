import Mathlib

open Finset EuclideanGeometry Filter

namespace Erdos98

noncomputable def h (n : ℕ) : ℕ :=
  sInf {k : ℕ | ∃ points : Finset ℝ², points.card = n ∧
    InGeneralPosition points ∧ k = distinctDistances points}

theorem erdos_98.variants.upper_bound :
    ∃ c > (0 : ℝ), ∀ᶠ n : ℕ in atTop, (h n : ℝ) < (n : ℝ) * Real.exp (c * Real.sqrt (Real.log (n : ℝ))) := by
  sorry

end Erdos98
