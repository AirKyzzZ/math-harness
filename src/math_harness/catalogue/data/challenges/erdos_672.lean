import Mathlib

namespace Erdos672

def Erdos672With (k l : ℕ) : Prop :=
  ∀ (s : Finset ℕ), s.card = k → ∀ᵉ (n > 0) (d > 0), n.gcd d = 1 →
    Set.IsAPOfLengthWith s k n d → ∀ q, ∏ i ∈ s, i ≠ q ^ l

theorem erdos_672 :
    ∃ᵉ (k ≥ 4) (l > 1), ¬ Erdos672With k l := by
  sorry

end Erdos672
