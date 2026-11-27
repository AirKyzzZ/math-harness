import Mathlib

namespace Erdos178

open Finset BigOperators

theorem erdos_178_neg :
    ¬ (∀ (a : ℕ → ℕ → ℕ) (ha : ∀ i, StrictMono (a i)), ∃ f : ℕ → ℤ, (∀ n, f n = 1 ∨ f n = -1) ∧ ∀ d : ℕ, ∃ C : ℕ, ∀ m i : ℕ, i < d → |∑ j ∈ range m, f (a i j)| ≤ ↑C) := by
  sorry

end Erdos178
