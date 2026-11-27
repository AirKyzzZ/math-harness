import Mathlib

open Filter Finset

open scoped Topology

namespace Erdos143

def WellSeparatedSet (A : Set ℝ) : Prop :=
  (A ⊆ (Set.Ioi (1 : ℝ))) ∧ Set.Infinite A ∧ Set.Countable A ∧
  (∀ x ∈ A, ∀ y ∈ A, x ≠ y → (∀ k ≥ (1 : ℕ), 1 ≤ |k * x - y|))

theorem erdos_143.parts.i :
    ∀ (A : Set ℝ), WellSeparatedSet A → liminf (fun x => (A ∩ (Set.Icc 1 x)).ncard / x) atTop = 0 := by
  sorry

-- TODO(firsching): add the two other conjectures.

end Erdos143
