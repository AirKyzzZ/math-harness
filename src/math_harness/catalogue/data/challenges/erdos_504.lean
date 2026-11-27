import Mathlib

open Real EuclideanGeometry

namespace Erdos504

noncomputable def minimaxAngle (N : ℕ) : ℝ :=
  sSup {α : ℝ | α ∈ Set.Icc 0 π ∧
    ∀ S : Finset ℂ, S.card = N →
      ∃ x ∈ S, ∃ z ∈ S, ∃ y ∈ S, x ≠ z ∧ y ≠ z ∧ x ≠ y ∧
        α ≤ EuclideanGeometry.angle x z y}

theorem erdos_504 {n : ℕ} (hn : 3 ≤ n) :
    minimaxAngle (2 ^ n) = (1 - 1 / (n : ℝ)) * π := by
  sorry

end Erdos504
