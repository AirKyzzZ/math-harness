import Mathlib

open Filter Real AdditiveCombinatorics

namespace Erdos772

noncomputable def H (k n : ℕ) : ℕ :=
  sSup {r | r ≤ n ∧ ∀ A : Finset ℕ, A.card = n → (∀ m, sumRep A m ≤ k) →
    ∃ S ⊆ A, IsSidon (S : Set ℕ) ∧ r ≤ S.card}

theorem erdos_772.parts.ii_neg :
    ¬ (∀ k ≥ 1, ∃ c > 0, ∀ᶠ n : ℕ in atTop, (n : ℝ) ^ (1 / 2 + c : ℝ) < H k n) := by
  sorry

end Erdos772
