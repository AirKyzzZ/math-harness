import Mathlib

open Finset Filter

namespace Erdos973

theorem erdos_973.variants.le_one :
    ∃ C : ℝ, C > 1 ∧ ∀ n : ℕ, n ≥ 2 → ∃ z : ℕ → ℂ, z 1 = 1 ∧ (∀ i ∈ Icc 1 n, ‖z i‖ ≤ 1) ∧ (∀ k ∈ Icc 2 (n + 1), ‖∑ i ∈ Icc 1 n, z i ^ k‖ < C ^ (-(n : ℝ))) := by
  sorry

end Erdos973
