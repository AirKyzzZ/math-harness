import Mathlib

namespace Erdos480

open Filter

theorem erdos_480_neg :
    ¬ (∀ (x : ℕ → ℝ), (∀ n, x n ∈ Set.Icc 0 1) → ⨅ (n : ℕ+), atTop.liminf (fun m => (n : ℕ) * |x (m + (n : ℕ)) - x m|) ≤ 1 / √5) := by
  sorry

end Erdos480
