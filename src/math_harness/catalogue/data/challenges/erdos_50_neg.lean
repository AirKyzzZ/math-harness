import Mathlib

open Filter Set MeasureTheory Topology

open scoped Nat Topology

namespace Erdos50

def IsDistributionOfPhiRatio (f : ℝ → ℝ) : Prop :=
  ∀ c ∈ Icc (0 : ℝ) 1, {n : ℕ | (φ n : ℝ) < c * n}.HasDensity (f c)

def IsPurelySingularOn (f : ℝ → ℝ) (s : Set ℝ) : Prop :=
  ContinuousOn f s ∧ ∀ᵐ x ∂(volume.restrict s), derivWithin f s x = 0

theorem erdos_50_neg :
    ¬ (∀ᵉ (f : ℝ → ℝ) (hf : IsDistributionOfPhiRatio f), ¬∃ x ∈ Icc (0 : ℝ) 1, ∃ y > 0, HasDerivWithinAt f y (Icc 0 1) x) := by
  sorry

end Erdos50
