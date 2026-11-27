import Mathlib

open Real EuclideanGeometry

namespace Erdos504

noncomputable def minimaxAngle (N : ℕ) : ℝ :=
  sSup {α : ℝ | α ∈ Set.Icc 0 π ∧
    ∀ S : Finset ℂ, S.card = N →
      ∃ x ∈ S, ∃ z ∈ S, ∃ y ∈ S, x ≠ z ∧ y ≠ z ∧ x ≠ y ∧
        α ≤ EuclideanGeometry.angle x z y}

theorem erdos_504.variants.szekeres_upper {t : ℕ} (ht : 0 < t) {ε : ℝ} (hε : 0 < ε) :
    ∃ S : Finset ℂ, S.card = 2 ^ t ∧ ∀ p ∈ S, ∀ q ∈ S, ∀ r ∈ S, p ≠ q → r ≠ q → EuclideanGeometry.angle p q r < (1 - 1 / (t : ℝ)) * π + ε := by
  sorry

end Erdos504
