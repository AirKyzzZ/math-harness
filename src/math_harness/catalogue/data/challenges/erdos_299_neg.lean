import Mathlib

open Filter

namespace Erdos299

theorem erdos_299_neg :
    ¬ (¬ (∃ (a : ℕ → ℕ), StrictMono a ∧ (∀ n, 0 < a n) ∧ (fun n ↦ (a (n + 1) : ℝ) - a n) =O[atTop] (1 : ℕ → ℝ) ∧ ∀ S : Finset ℕ, ∑ i ∈ S, (1 : ℝ) / a i ≠ 1)) := by
  sorry

end Erdos299
