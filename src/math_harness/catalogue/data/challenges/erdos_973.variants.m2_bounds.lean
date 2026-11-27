import Mathlib

open Finset Filter

namespace Erdos973

theorem erdos_973.variants.m2_bounds :
    ∀ᶠ n : ℕ in atTop, ∀ M_2 : ℝ, IsGLB { M | ∃ z : ℕ → ℂ, (∀ j ∈ Icc 1 n, ‖z j‖ ≤ 1) ∧ (∃ j ∈ Icc 1 n, ‖z j‖ = 1) ∧ (∃ k ∈ Icc 2 (n + 1), M = ‖∑ j ∈ Icc 1 n, z j ^ k‖ ∧ ∀ m ∈ Icc 2 (n + 1), ‖∑ j ∈ Icc 1 n, z j ^ m‖ ≤ M) } M_2 → (1.746 : ℝ) ^ (-(n : ℝ)) < M_2 ∧ M_2 < (1.745 : ℝ) ^ (-(n : ℝ)) := by
  sorry

end Erdos973
