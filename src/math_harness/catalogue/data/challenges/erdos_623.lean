import Mathlib

open Filter Real Set

open scoped Cardinal Ordinal

namespace Erdos623

universe u

theorem erdos_623 :
    ∀ (X : Type u) (hX : #X = ℵ_ ω) (f : Finset X → X), (∀ A : Finset X, f A ∉ A) → (∃ Y : Set X, Set.Infinite Y ∧ (∀ (B : Finset X), ↑B ⊆ Y → f B ∉ Y)) := by
  sorry

-- TODO(firsching): formalize the statement about X < ℵ_ω

end Erdos623
