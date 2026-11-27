import Mathlib

namespace Erdos480

open Filter

theorem erdos_480.variants.chung_graham_best_possible :
    let c : ℝ := 1 + ∑' (k : ℕ+), (1 : ℝ) / (2*k : ℕ).fib ∀ ε > (0 : ℝ), ¬ (∀ (x : ℕ → ℝ), (∀ n, x n ∈ Set.Icc 0 1) → ⨅ (n : ℕ+), atTop.liminf (fun m => (n : ℕ) * |x (m + (n : ℕ)) - x m|) ≤ 1 / c - ε) := by
  sorry

end Erdos480
