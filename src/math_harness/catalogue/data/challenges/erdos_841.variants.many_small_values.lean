import Mathlib

open Filter Real Topology

namespace Erdos841

noncomputable def t (n : ℕ) : ℕ :=
  sInf {T | ∃ J ⊆ Finset.Icc 1 T, IsSquare (n * ∏ j ∈ J, (n + j))}

open scoped Classical in
theorem erdos_841.variants.many_small_values :
    ∃ K : ℝ, Tendsto (fun x : ℕ ↦ log (((Finset.Icc 1 x).filter fun n ↦ (t n : ℝ) ≤ exp (K * √(log n * log (log n)))).card : ℝ) / log x) atTop (𝓝 1) := by
  sorry

end Erdos841
