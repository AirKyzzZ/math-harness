import Mathlib

open Filter Set

open scoped Pointwise Topology

namespace Erdos899

open Erdos899

theorem erdos_899 :
    ∀ (A : Set ℕ), A.Infinite → Tendsto (fun N => (A ∩ Icc 1 N |>.ncard : ℝ) / N) atTop (𝓝 0) → atTop.limsup (fun N => ((A - A : Set ℕ) ∩ Icc 1 N |>.ncard : EReal) / (A ∩ Icc 1 N).ncard) = ⊤ := by
  sorry

end Erdos899
