import Mathlib

namespace Erdos1113

def HasFinitePrimeCoveringSet (k : ℕ) : Prop :=
  ∃ P : Finset ℕ, (∀ p ∈ P, p.Prime) ∧ ∀ n, ∃ p ∈ P, p ∣ (k * 2 ^ n + 1)

theorem erdos_1113.variants.filaseta_finch_kozek :
    ∀ k, k.IsSierpinskiNumber → k.IsPerfectPower ∨ HasFinitePrimeCoveringSet k := by
  sorry

end Erdos1113
