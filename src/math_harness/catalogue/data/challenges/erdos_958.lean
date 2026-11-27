import Mathlib

open Finset EuclideanGeometry

namespace Erdos958

def IsEquidistantOnLine (A : Finset ℝ²) : Prop :=
  ∃ a v : ℝ², v ≠ 0 ∧ (A : Set ℝ²) = {x | ∃ i : ℕ, i < #A ∧ x = a + (i : ℝ) • v}

def IsEquidistantOnCircle (A : Finset ℝ²) : Prop :=
  ∃ (c : ℝ²) (r θ α : ℝ), 0 < r ∧ α ≠ 0 ∧ (A : Set ℝ²) =
    {x | ∃ i : ℕ, i < #A ∧
      x = c + r • (!₂[Real.cos (θ + (i : ℝ) * α), Real.sin (θ + (i : ℝ) * α)])}

theorem erdos_958 :
    ¬ ∃ N : ℕ, ∀ n ≥ N, ∀ A : Finset ℝ², #A = n → ((#(distanceSet A) = n - 1 ∧ (distanceSet A).image (distanceMultiplicity A) = Finset.Icc 1 (n - 1)) → (IsEquidistantOnLine A ∨ IsEquidistantOnCircle A)) := by
  sorry

end Erdos958
