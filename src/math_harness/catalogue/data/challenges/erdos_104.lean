import Mathlib

open Filter

open scoped EuclideanGeometry

namespace Erdos104

open EuclideanGeometry

noncomputable def unitCircleCount (P : Finset ℝ²) : ℕ :=
  Set.ncard {s : Sphere ℝ² | s.radius = 1 ∧ 3 ≤ {p ∈ (P : Set ℝ²) | p ∈ s}.ncard}

noncomputable def possibleUnitCircleCounts (n : ℕ) : Set ℕ :=
  {k | ∃ P : Finset ℝ², P.card = n ∧ unitCircleCount P = k}

noncomputable def maxUnitCircleCount (n : ℕ) : ℕ :=
  sSup (possibleUnitCircleCounts n)

theorem erdos_104 :
    (fun n : ℕ => (maxUnitCircleCount n : ℝ)) =o[atTop] (fun n : ℕ => (n : ℝ) ^ 2) := by
  sorry

end Erdos104
