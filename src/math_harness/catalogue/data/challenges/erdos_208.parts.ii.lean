import Mathlib

open Filter Real

namespace Erdos208

noncomputable def erdos208.s : ℕ → ℕ := Nat.nth Squarefree

open erdos208

theorem erdos_208.parts.ii :
    ∃ (c : ℕ → ℝ), (c =o[atTop] (1 : ℕ → ℝ)) ∧ ∀ᶠ n in atTop, s (n + 1) - s n ≤ (1 + (c n)) * (π^2 / 6) * log (s n) / log (log (s n)) := by
  sorry

end Erdos208
