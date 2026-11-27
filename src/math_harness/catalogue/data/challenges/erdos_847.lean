import Mathlib

namespace Erdos847

def HasFew3APs (A : Set ℕ) := ∃ (ε : ℝ), ε > 0 ∧ ∀ (B : Set ℕ), B ⊆ A → Finite B →
  ∃ (C : Set ℕ), C ⊆ B ∧ C.ncard ≥ ε * B.ncard ∧ ThreeAPFree C

theorem erdos_847 :
    ¬ ∀ (A : Set ℕ), Infinite A → HasFew3APs A → ∃ n, ∃ (S : Fin n → Set ℕ), (∀ i, ThreeAPFree (S i)) ∧ A = ⋃ i : Fin n, S i := by
  sorry

end Erdos847
