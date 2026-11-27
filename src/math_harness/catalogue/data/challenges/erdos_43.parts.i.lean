import Mathlib

open scoped Pointwise

namespace Erdos43

noncomputable abbrev f (N : ℕ) : ℕ := Finset.maxSidonSubsetCard (Finset.Icc 1 N)

theorem erdos_43.parts.i :
    ¬ ∃ C : ℝ, ∀ᶠ N in Filter.atTop, ∀ (A B : Finset ℕ), A ⊆ Finset.Icc 1 N → B ⊆ Finset.Icc 1 N → IsSidon (A : Set ℕ) → IsSidon (B : Set ℕ) → (A - A) ∩ (B - B) = {0} → ((A.card.choose 2 + B.card.choose 2 : ℕ) : ℝ) ≤ ((f N).choose 2 : ℝ) + C := by
  sorry

end Erdos43
