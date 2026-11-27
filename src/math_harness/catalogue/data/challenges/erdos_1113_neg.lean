import Mathlib

namespace Erdos1113

def HasFinitePrimeCoveringSet (k : ℕ) : Prop :=
  ∃ P : Finset ℕ, (∀ p ∈ P, p.Prime) ∧ ∀ n, ∃ p ∈ P, p ∣ (k * 2 ^ n + 1)

theorem erdos_1113_neg :
    ¬ (∃ k, k.IsSierpinskiNumber ∧ ¬ HasFinitePrimeCoveringSet k) := by
  sorry

end Erdos1113
