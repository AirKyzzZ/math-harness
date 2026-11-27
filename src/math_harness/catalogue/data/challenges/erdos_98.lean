import Mathlib

open Finset EuclideanGeometry Filter

namespace Erdos98

noncomputable def h (n : ℕ) : ℕ :=
  sInf {k : ℕ | ∃ points : Finset ℝ², points.card = n ∧
    InGeneralPosition points ∧ k = distinctDistances points}

theorem erdos_98 :
    Tendsto (fun n : ℕ ↦ ((h n : ℝ) / (n : ℝ))) atTop atTop := by
  sorry

end Erdos98
