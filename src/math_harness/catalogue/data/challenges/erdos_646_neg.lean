import Mathlib

open scoped Nat

namespace Erdos646

theorem erdos_646_neg :
    ¬ (∀ S : Finset ℕ, (∀ p ∈ S, p.Prime) → {n : ℕ | ∀ p ∈ S, Even (padicValNat p (n !))}.Infinite) := by
  sorry

end Erdos646
