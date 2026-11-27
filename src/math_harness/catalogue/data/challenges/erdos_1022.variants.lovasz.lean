import Mathlib

namespace Erdos1022

def SparseImpliesPropertyB (t : ℕ) (c : ℝ) : Prop :=
  ∀ F : Finset (Finset ℕ), (∀ A ∈ F, t ≤ A.card) →
    (∀ X : Finset ℕ, X.Nonempty → ((F.hypergraphInduce X).card : ℝ) < c * (X.card : ℝ)) →
    F.HasPropertyB

theorem erdos_1022.variants.lovasz :
    IsGreatest {c : ℝ | SparseImpliesPropertyB 2 c} 1 := by
  sorry

end Erdos1022
