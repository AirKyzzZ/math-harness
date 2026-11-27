import Mathlib

namespace Erdos1022

def SparseImpliesPropertyB (t : ℕ) (c : ℝ) : Prop :=
  ∀ F : Finset (Finset ℕ), (∀ A ∈ F, t ≤ A.card) →
    (∀ X : Finset ℕ, X.Nonempty → ((F.hypergraphInduce X).card : ℝ) < c * (X.card : ℝ)) →
    F.HasPropertyB

theorem erdos_1022_neg :
    ¬ (¬ ∃ c : ℕ → ℝ, Filter.Tendsto c Filter.atTop Filter.atTop ∧ ∀ t : ℕ, SparseImpliesPropertyB t (c t)) := by
  sorry

end Erdos1022
