import Mathlib

namespace Erdos290

noncomputable def harmonicDen (a b : ℕ) : ℕ := (harmonicBlock a b).den

theorem erdos_290_neg :
    ¬ ((∀ a : ℕ, 1 ≤ a → ∃ b : ℕ, a < b ∧ harmonicDen a (b + 1) < harmonicDen a b)) := by
  sorry

end Erdos290
