import Mathlib

open Finset Filter

namespace Erdos973

theorem erdos_973 :
    ¬ ∃ C : ℝ, C > 1 ∧ ∀ n : ℕ, n ≥ 2 → ∃ z : ℕ → ℂ, z 1 = 1 ∧ (∀ i ∈ Icc 1 n, 1 ≤ ‖z i‖) ∧ (∀ k ∈ Icc 2 (n + 1), ‖∑ i ∈ Icc 1 n, z i ^ k‖ < C ^ (-(n : ℝ))) := by
  sorry

end Erdos973
