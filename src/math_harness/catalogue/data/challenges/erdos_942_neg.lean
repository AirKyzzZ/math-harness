import Mathlib

open Nat Filter Topology

namespace Erdos942

def erdos_942.h (n : ℕ) : ℕ := ((Finset.Ico (n ^ 2) ((n + 1) ^ 2)).filter Powerful).card

theorem erdos_942_neg :
    ¬ (∃ c > 0, ∃ (o : ℕ → ℝ), o =o[atTop] (1 : ℕ → ℝ) ∧ (∀ᶠ n in atTop, erdos_942.h n < (Real.log n) ^ (c + o n)) ∧ {n | erdos_942.h n > (Real.log n) ^ (c - o n)}.Infinite) := by
  sorry

end Erdos942
