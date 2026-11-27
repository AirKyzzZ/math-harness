import Mathlib

open Function Set Filter

namespace Erdos329

noncomputable def sqrtPartialDensity (A : Set ℕ) (N : ℕ) : ℝ :=
  (A ∩ Set.Icc 1 N).ncard / (N : ℝ).sqrt

noncomputable def sidonUpperDensity (A : Set ℕ) : ℝ :=
  limsup (fun N => sqrtPartialDensity A N) atTop

theorem erdos_329.variants.converse_implication :
    (sSup {sidonUpperDensity A | (A : Set ℕ) (_ : IsSidon A)} = 1) → (∀ (A : Finset ℕ), IsSidon (A : Set ℕ) → ∃ (D : Set ℕ) (n : ℕ) (_ : n > 0), ↑A ⊆ D ∧ IsPerfectDifferenceSet D n) := by
  sorry

end Erdos329
