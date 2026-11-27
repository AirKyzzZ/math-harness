import Mathlib

open Polynomial Set

namespace Erdos477

theorem erdos_477.variants.monomial_neg :
    ¬ (¬ ∀ (k : ℕ), 2 ≤ k → letI f := X ^ k ∀ A : Set ℤ, ∃ z, ¬ ∃! a ∈ A ×ˢ (Set.range f.eval), z = a.1 + a.2) := by
  sorry

end Erdos477
