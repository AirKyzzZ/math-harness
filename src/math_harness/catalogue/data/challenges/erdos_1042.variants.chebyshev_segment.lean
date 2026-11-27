import Mathlib

open Filter Polynomial Erdos1047

open scoped ENNReal

namespace Erdos1042

noncomputable def nthDiameter (F : Set ℂ) (n : ℕ) : ℝ≥0∞ :=
  ⨆ z : Fin n → ℂ, ⨆ _ : ∀ i, z i ∈ F,
    (∏ i : Fin n, ∏ j ∈ Finset.Ioi i, edist (z i) (z j)) ^ (1 / ((n.choose 2 : ℕ) : ℝ))

noncomputable def transfiniteDiameter (F : Set ℂ) : ℝ≥0∞ :=
  Filter.limsup (fun n : ℕ ↦ nthDiameter F n) atTop

def MonicWithRootsIn (F : Set ℂ) (n : ℕ) (f : ℂ[X]) : Prop :=
  f.Monic ∧ f.natDegree = n ∧ ∀ z ∈ f.roots, z ∈ F

noncomputable def numComponents (f : ℂ[X]) : ℕ :=
  (componentsIn (strictSublevelSet f 1)).ncard

theorem erdos_1042.variants.chebyshev_segment (F : Set ℂ) (hF : F = Complex.ofReal '' Set.Icc (-2 : ℝ) 2) :
    IsClosed F ∧ transfiniteDiameter F = 1 ∧ (∀ c : ℂ, ¬ F ⊆ Metric.closedBall c 1) ∧ ∀ n : ℕ, 1 ≤ n → ∃ f : ℂ[X], MonicWithRootsIn F n f ∧ numComponents f = n := by
  sorry

end Erdos1042
