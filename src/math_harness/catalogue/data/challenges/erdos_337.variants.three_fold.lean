import Mathlib

namespace Erdos337

open Filter Set Asymptotics

open scoped Pointwise

theorem erdos_337.variants.three_fold :
    ∀ A : Set ℕ, A.IsAsymptoticAddBasis → (fun N : ℕ ↦ ((A ∩ Icc 1 N).ncard : ℝ)) =o[atTop] (fun N : ℕ ↦ (N : ℝ)) → Tendsto (fun N : ℕ ↦ (((A + A + A) ∩ Icc 1 (3 * N)).ncard : ℝ) / ((A ∩ Icc 1 N).ncard : ℝ)) atTop atTop := by
  sorry

end Erdos337
