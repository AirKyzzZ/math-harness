import Mathlib

namespace Erdos483

def HasTriple {k N : ℕ} (χ : Fin N → Fin k) : Prop :=
  ∃ a b c : Fin N, (a.val + 1) + (b.val + 1) = c.val + 1 ∧
    χ a = χ b ∧ χ b = χ c

def Forces (k N : ℕ) : Prop := ∀ χ : Fin N → Fin k, HasTriple χ

theorem forces_one_two : Forces 1 2 := by
  unfold Forces HasTriple
  decide

theorem not_forces_one_one : ¬ Forces 1 1 := by
  unfold Forces HasTriple
  decide

theorem erdos_483 :
    ∃ C : ℝ, 0 < C ∧ ∀ k : ℕ, 0 < k → ∃ N : ℕ, (N : ℝ) < C ^ k ∧ Forces k N := by
  sorry

end Erdos483
