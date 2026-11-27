import Mathlib

namespace Erdos1022

def SparseImpliesPropertyB (t : ℕ) (c : ℝ) : Prop :=
  ∀ F : Finset (Finset ℕ), (∀ A ∈ F, t ≤ A.card) →
    (∀ X : Finset ℕ, X.Nonempty → ((F.hypergraphInduce X).card : ℝ) < c * (X.card : ℝ)) →
    F.HasPropertyB

theorem erdos_1022.variants.lt_two_neg :
    ¬ (∀ (t : ℕ) (c : ℝ), SparseImpliesPropertyB t c → c < 2) := by
  sorry

end Erdos1022
