import Mathlib

open Finset Filter

namespace Erdos973

theorem erdos_973.variants.tang :
    ∃ f : ℕ → ℝ, f =o[atTop] (fun _ ↦ (1 : ℝ)) ∧ ∀ᶠ n in atTop, ∀ z : ℕ → ℂ, (∀ i ∈ Icc 1 n, 1 ≤ ‖z i‖) → ∃ k ∈ Icc 2 (n + 1), ‖∑ i ∈ Icc 1 n, z i ^ k‖ ≥ (2 * Real.exp 1) ^ (-(1 + f n) * (n : ℝ)) := by
  sorry

end Erdos973
