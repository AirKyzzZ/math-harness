import Mathlib

namespace Erdos1113

def HasFinitePrimeCoveringSet (k : ℕ) : Prop :=
  ∃ P : Finset ℕ, (∀ p ∈ P, p.Prime) ∧ ∀ n, ∃ p ∈ P, p ∣ (k * 2 ^ n + 1)

theorem erdos_1113.variants.infinitely_many_sierpinski :
    Set.Infinite {k : ℕ | k.IsSierpinskiNumber} := by
  sorry

end Erdos1113
