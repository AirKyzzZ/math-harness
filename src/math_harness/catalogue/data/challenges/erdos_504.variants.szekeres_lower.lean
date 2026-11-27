import Mathlib

open Real EuclideanGeometry

namespace Erdos504

noncomputable def minimaxAngle (N : ℕ) : ℝ :=
  sSup {α : ℝ | α ∈ Set.Icc 0 π ∧
    ∀ S : Finset ℂ, S.card = N →
      ∃ x ∈ S, ∃ z ∈ S, ∃ y ∈ S, x ≠ z ∧ y ≠ z ∧ x ≠ y ∧
        α ≤ EuclideanGeometry.angle x z y}

theorem erdos_504.variants.szekeres_lower {n : ℕ} (hn : 0 < n) (S : Finset ℂ) (hcard : 2 ^ n < S.card) :
    ∃ p ∈ S, ∃ q ∈ S, ∃ r ∈ S, p ≠ q ∧ r ≠ q ∧ (1 - 1 / (n : ℝ)) * π < EuclideanGeometry.angle p q r := by
  sorry

end Erdos504
