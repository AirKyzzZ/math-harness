import Mathlib

open Finset Filter

namespace Erdos862

noncomputable def numMaximalSidonSets (N : ℕ) : ℕ :=
  {A : Finset ℕ | A ⊆ Icc 1 N ∧ Set.IsMaximalSidonSetIn (A : Set ℕ) N}.ncard

theorem erdos_862.variants.lower_bound (ε : ℝ) (hε : 0 < ε) :
    ∀ᶠ N : ℕ in atTop, (2 : ℝ) ^ (((0.16 : ℝ) - ε) * (N : ℝ) ^ (1 / 2 : ℝ)) ≤ (numMaximalSidonSets N : ℝ) := by
  sorry

end Erdos862
