import Mathlib

namespace Erdos689

theorem erdos_689_neg :
    ¬ (∀ᶠ n in .atTop, ∃ a : ℕ → ℕ, ∀ m ∈ Finset.Icc 1 n, 2 ≤ (Finset.Icc 1 n |>.filter fun p => p.Prime ∧ a p ≡ m [MOD p]).card) := by
  sorry

end Erdos689
