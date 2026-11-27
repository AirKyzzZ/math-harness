import Mathlib

open Real EuclideanGeometry

namespace Erdos504

noncomputable def minimaxAngle (N : ℕ) : ℝ :=
  sSup {α : ℝ | α ∈ Set.Icc 0 π ∧
    ∀ S : Finset ℂ, S.card = N →
      ∃ x ∈ S, ∃ z ∈ S, ∃ y ∈ S, x ≠ z ∧ y ≠ z ∧ x ≠ y ∧
        α ≤ EuclideanGeometry.angle x z y}

theorem erdos_504.variants.erdos_szekeres_1960 {n : ℕ} (hn : 3 ≤ n) (S : Finset ℂ) (hcard : S.card = 2 ^ n) :
    ∃ p ∈ S, ∃ q ∈ S, ∃ r ∈ S, p ≠ q ∧ r ≠ q ∧ (1 - 1 / (n : ℝ)) * π < EuclideanGeometry.angle p q r := by
  sorry

end Erdos504
