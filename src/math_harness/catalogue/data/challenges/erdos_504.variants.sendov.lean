import Mathlib

open Real EuclideanGeometry

namespace Erdos504

noncomputable def minimaxAngle (N : ℕ) : ℝ :=
  sSup {α : ℝ | α ∈ Set.Icc 0 π ∧
    ∀ S : Finset ℂ, S.card = N →
      ∃ x ∈ S, ∃ z ∈ S, ∃ y ∈ S, x ≠ z ∧ y ≠ z ∧ x ≠ y ∧
        α ≤ EuclideanGeometry.angle x z y}

theorem erdos_504.variants.sendov {n N : ℕ} (hn : 3 ≤ n) (h1 : 2 ^ (n - 1) < N) (h2 : N ≤ 2 ^ n) :
    minimaxAngle N = if 2 ^ (n - 1) + 2 ^ (n - 3) < N then (1 - 1 / (n : ℝ)) * π else (1 - 2 / (2 * (n : ℝ) - 1)) * π := by
  sorry

end Erdos504
