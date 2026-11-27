import Mathlib

open Filter Topology

namespace Erdos281

def ResidueChoice (n : ℕ → ℕ) := ∀ i : ℕ, ZMod (n i)

def avoidAll (n : ℕ → ℕ) (a : ResidueChoice n) : Set ℤ :=
  {m | ∀ i : ℕ, (m : ZMod (n i)) ≠ a i}

def avoidPrefix (n : ℕ → ℕ) (a : ResidueChoice n) (k : ℕ) : Set ℤ :=
  {m | ∀ i : ℕ, i < k → (m : ZMod (n i)) ≠ a i}

theorem erdos_281_neg :
    ¬ (∀ (n : ℕ → ℕ), StrictMono n → (∀ i, 0 < n i) → (∀ a : ResidueChoice n, Set.HasIntDensity (avoidAll n a) 0) → ∀ ε : ℝ, 0 < ε → ∃ k : ℕ, ∀ a : ResidueChoice n, ∃ d : ℝ, Set.HasIntDensity (avoidPrefix n a k) d ∧ d < ε) := by
  sorry

end Erdos281
