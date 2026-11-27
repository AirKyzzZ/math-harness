import Mathlib

namespace Erdos245

open Filter Set Erdos245

open scoped Pointwise Topology

theorem erdos_245 :
    ∀ (A : Set ℕ), A.Infinite → atTop.Tendsto (fun N ↦ (A ∩ Icc 1 ⌊N⌋₊ |>.ncard : ℝ) / N) (𝓝 0) → 3 ≤ atTop.limsup fun N : ℝ ↦ ((A + A) ∩ Icc 1 ⌊N⌋₊ |>.ncard : EReal) / (A ∩ Icc 1 ⌊N⌋₊).ncard := by
  sorry

end Erdos245
