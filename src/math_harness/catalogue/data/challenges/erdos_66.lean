import Mathlib

namespace Erdos66

open Filter AdditiveCombinatorics

open scoped Topology

theorem erdos_66 :
    ∃ (A : Set ℕ) (c : ℝ), c ≠ 0 ∧ Tendsto (fun n ↦ (sumRep A n : ℝ) / Real.log n) atTop (𝓝 c) := by
  sorry

-- TODO(firsching): add the theorems/conjectures for the comments on the page

end Erdos66
