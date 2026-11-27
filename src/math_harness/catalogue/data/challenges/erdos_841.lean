import Mathlib

open Filter Real Topology

namespace Erdos841

noncomputable def t (n : ℕ) : ℕ :=
  sInf {T | ∃ J ⊆ Finset.Icc 1 T, IsSquare (n * ∏ j ∈ J, (n + j))}

open scoped Classical in
theorem erdos_841 (c : ℝ) (hc : c ∈ Set.Ioc 0 1) :
    Tendsto (fun x : ℕ ↦ ((((Finset.Icc 1 x).filter fun n : ℕ ↦ (t n : ℝ) ≤ (n : ℝ) ^ c).card : ℝ) - ((Finset.Icc 1 x).filter fun n : ℕ ↦ (n.maxPrimeFac : ℝ) ≤ (n : ℝ) ^ c).card) / x) atTop (𝓝 0) := by
  sorry

end Erdos841
