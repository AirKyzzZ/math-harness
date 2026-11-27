import Mathlib

open scoped Pointwise

namespace Erdos52

theorem erdos_52 :
    ∀ (ε : ℝ), 0 < ε → ε < 1 → ∃ (C : ℝ), 0 < C ∧ ∀ (A : Finset ℤ), (max (A + A).card (A * A).card : ℝ) ≥ C * (A.card : ℝ) ^ (2 - ε) := by
  sorry

open scoped Classical in
noncomputable def sumProductExponentReal : ℝ :=
  sSup {s : ℝ | ∀ ε > 0, ∃ C > 0, ∀ A : Finset ℝ, A.Nonempty →
    (max (A + A).card (A * A).card : ℝ) ≥ C * (A.card : ℝ) ^ (s - ε)}

-- TODO(firsching): Add additional material.

end Erdos52
