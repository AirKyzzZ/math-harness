import Mathlib

open scoped BigOperators

namespace Erdos519

noncomputable def powerSum {n : ℕ} (z : Fin n → ℂ) (k : ℕ) : ℂ :=
  ∑ i : Fin n, z i ^ k

theorem erdos_519 :
    ∃ c : ℝ, 0 < c ∧ ∀ (n : ℕ) (hn : 0 < n) (z : Fin n → ℂ), z ⟨0, hn⟩ = 1 → ∃ k : Fin n, c < ‖powerSum z (k.val + 1)‖ := by
  sorry

end Erdos519
