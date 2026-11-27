import Mathlib

open Filter

namespace Erdos895

theorem erdos_895_neg :
    ¬ (∀ᶠ n in atTop, ∀ G : SimpleGraph (Set.Icc 1 n), G.CliqueFree 3 → ∃ a b c : Set.Icc 1 n, a ≠ b ∧ (a : ℕ) + (b : ℕ) = c ∧ G.IsIndepSet {a, b, c}) := by
  sorry

end Erdos895
