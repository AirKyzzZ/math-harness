import Mathlib

open Filter Real AdditiveCombinatorics

namespace Erdos772

noncomputable def H (k n : ℕ) : ℕ :=
  sSup {r | r ≤ n ∧ ∀ A : Finset ℕ, A.card = n → (∀ m, sumRep A m ≤ k) →
    ∃ S ⊆ A, IsSidon (S : Set ℕ) ∧ r ≤ S.card}

theorem erdos_772.variants.upper_bound :
    ∃ C : ℝ, ∀ k ≥ 4, ∀ᶠ n : ℕ in atTop, (H k n : ℝ) ≤ C * (n : ℝ) ^ (2 / 3 : ℝ) := by
  sorry

end Erdos772
