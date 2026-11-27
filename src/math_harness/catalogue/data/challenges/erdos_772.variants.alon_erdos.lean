import Mathlib

open Filter Real AdditiveCombinatorics

namespace Erdos772

noncomputable def H (k n : ℕ) : ℕ :=
  sSup {r | r ≤ n ∧ ∀ A : Finset ℕ, A.card = n → (∀ m, sumRep A m ≤ k) →
    ∃ S ⊆ A, IsSidon (S : Set ℕ) ∧ r ≤ S.card}

theorem erdos_772.variants.alon_erdos (k : ℕ) (hk : 1 ≤ k) :
    ∃ c > 0, ∀ᶠ n : ℕ in atTop, c * (n : ℝ) ^ (2 / 3 : ℝ) ≤ H k n := by
  sorry

end Erdos772
