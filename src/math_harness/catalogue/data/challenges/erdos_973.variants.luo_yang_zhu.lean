import Mathlib

open Finset Filter

namespace Erdos973

theorem erdos_973.variants.luo_yang_zhu (lam : ℝ) (hlam : 0 < lam) :
    ∀ᶠ n in atTop, ∀ z : ℕ → ℂ, (∀ i ∈ Icc 1 n, 1 ≤ ‖z i‖) → ∃ k ∈ Icc 2 (n + 1), Real.exp (-lam * n) < ‖∑ i ∈ Icc 1 n, z i ^ k‖ := by
  sorry

end Erdos973
