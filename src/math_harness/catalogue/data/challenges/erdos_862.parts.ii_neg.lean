import Mathlib

open Finset Filter

namespace Erdos862

noncomputable def numMaximalSidonSets (N : ℕ) : ℕ :=
  {A : Finset ℕ | A ⊆ Icc 1 N ∧ Set.IsMaximalSidonSetIn (A : Set ℕ) N}.ncard

theorem erdos_862.parts.ii_neg :
    ¬ (∃ c : ℝ, 0 < c ∧ ∀ᶠ N : ℕ in atTop, (2 : ℝ) ^ ((N : ℝ) ^ c) < (numMaximalSidonSets N : ℝ)) := by
  sorry

end Erdos862
