import Mathlib

namespace Erdos45

theorem erdos_45_neg :
    ¬ (∀ k : ℕ, 2 ≤ k → ∃ n : ℕ, ∀ colouring : ℕ → Fin k, ∃ colour : Fin k, ∃ D' ⊆ {d ∈ n.divisors | 1 < d ∧ d < n}, (∀ d ∈ D', colouring d = colour) ∧ D'.reciprocalSum = 1) := by
  sorry

end Erdos45
