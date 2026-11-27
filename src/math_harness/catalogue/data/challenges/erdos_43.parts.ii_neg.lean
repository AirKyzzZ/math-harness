import Mathlib

open scoped Pointwise

namespace Erdos43

noncomputable abbrev f (N : ℕ) : ℕ := Finset.maxSidonSubsetCard (Finset.Icc 1 N)

theorem erdos_43.parts.ii_neg :
    ¬ (¬ ∃ᵉ (c > 0), ∃ o : ℕ → ℝ, o =o[Filter.atTop] (1 : ℕ → ℝ) ∧ ∀ᶠ N in Filter.atTop, ∀ (A B : Finset ℕ), A ⊆ Finset.Icc 1 N → B ⊆ Finset.Icc 1 N → IsSidon (A : Set ℕ) → IsSidon (B : Set ℕ) → A.card = B.card → (A - A) ∩ (B - B) = {0} → ((A.card.choose 2 + B.card.choose 2 : ℕ) : ℝ) ≤ (1 - c + o N) * ((f N).choose 2 : ℝ)) := by
  sorry

end Erdos43
