import Mathlib

open Finset Filter

namespace Erdos862

noncomputable def numMaximalSidonSets (N : ℕ) : ℕ :=
  {A : Finset ℕ | A ⊆ Icc 1 N ∧ Set.IsMaximalSidonSetIn (A : Set ℕ) N}.ncard

theorem erdos_862.parts.i :
    ¬ (fun N : ℕ => Real.logb 2 (numMaximalSidonSets N : ℝ)) =o[atTop] (fun N : ℕ => (N : ℝ) ^ (1 / 2 : ℝ)) := by
  sorry

end Erdos862
