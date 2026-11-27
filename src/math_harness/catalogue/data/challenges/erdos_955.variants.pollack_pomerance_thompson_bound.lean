import Mathlib

open Nat Filter

open scoped ArithmeticFunction ArithmeticFunction.sigma Topology

namespace Erdos955

def s (n : ℕ) : ℕ := σ 1 n - n

theorem s_one : s 1 = 0 := by decide

theorem s_two : s 2 = 1 := by decide

theorem s_six : s 6 = 6 := by decide

theorem s_twelve : s 12 = 16 := by decide

theorem s_twenty_eight : s 28 = 28 := by decide

open scoped Classical in
theorem erdos_955.variants.pollack_pomerance_thompson_bound :
    ∀ (A : Set ℕ) (ε : ℕ → ℝ), Tendsto ε atTop (𝓝 0) → (∀ᶠ n : ℕ in atTop, (count (· ∈ A) n : ℝ) ≤ (n : ℝ) ^ ((1 / 2 : ℝ) + ε n)) → { x | s x ∈ A }.HasDensity 0 := by
  sorry

end Erdos955
