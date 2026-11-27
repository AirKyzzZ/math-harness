import Mathlib

open AdditiveCombinatorics

namespace Erdos328

theorem erdos_328 :
    ¬ ∀ C : ℕ, 0 < C → ∃ t : ℕ, ∀ A : Set ℕ, (∀ n, sumRep A n ≤ C) → ∃ P : Fin t → Set ℕ, (⋃ i, P i) = A ∧ Set.univ.PairwiseDisjoint P ∧ ∀ i, ∀ n, sumRep (P i) n < C := by
  sorry

end Erdos328
