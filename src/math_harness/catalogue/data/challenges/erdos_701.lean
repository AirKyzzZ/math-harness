import Mathlib

namespace Erdos701

open Cardinal

theorem erdos_701 :
    ∀ {X : Type} [Nonempty X] [Fintype X], ∀ (F : Set (Set X)), IsLowerSet F → ∃ x : X, ∀ᵉ (F' ⊆ F), F'.Intersecting → (#F' ≤ #{ A : Set X | A ∈ F ∧ x ∈ A }) := by
  sorry

end Erdos701
