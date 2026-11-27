import Mathlib

namespace Erdos443

def A (m : ℕ) : Finset ℕ := (Finset.Icc 1 (m / 2)).image fun k => k * (m - k)

theorem erdos_443.parts.i :
    ∀ s : ℕ, ∃ m n : ℕ, n < m ∧ s ≤ (A n ∩ A m).card := by
  sorry

end Erdos443
