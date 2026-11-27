import Mathlib

open Polynomial Set

namespace Erdos477

theorem erdos_477_neg :
    ¬ (∃ f : ℤ[X], 2 ≤ f.degree ∧ ∃ A : Set ℤ, ∀ z, ∃! ab ∈ A ×ˢ (Set.range f.eval), z = ab.1 + ab.2) := by
  sorry

end Erdos477
