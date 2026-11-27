import Mathlib

open Filter

namespace Erdos447

noncomputable def maxUnionFree (n : ℕ) : ℕ :=
  sSup { k | ∃ F : Finset (Finset (Fin n)), F.UnionFree ∧ F.card = k }

theorem erdos_447.parts.ii :
    ∃ c : ℕ → ℝ, (c =o[atTop] (1 : ℕ → ℝ)) ∧ ∀ᶠ n : ℕ in atTop, (maxUnionFree n : ℝ) < (1 + c n) * (n.choose (n / 2) : ℝ) := by
  sorry

end Erdos447
