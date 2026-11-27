import Mathlib

namespace Erdos777

def comparableGraph {n : ℕ} (𝓕 : Finset (Finset (Fin n))) : SimpleGraph {A // A ∈ 𝓕} where
  Adj A B := A.1 < B.1 ∨ B.1 < A.1
  symm := ⟨by intro A B; tauto⟩
  loopless := ⟨by intro A h; exact (lt_irrefl A.1) (h.elim id id)⟩

theorem comparableGraph_adj {n : ℕ} {𝓕 : Finset (Finset (Fin n))} {A B : {S // S ∈ 𝓕}} :
    (comparableGraph 𝓕).Adj A B ↔ A.1 < B.1 ∨ B.1 < A.1 :=
  Iff.rfl

open scoped Classical in
noncomputable def comparableEdges {n : ℕ} (𝓕 : Finset (Finset (Fin n))) : ℕ :=
  (comparableGraph 𝓕).edgeFinset.card

theorem erdos_777.parts.i_neg :
    ¬ (∀ ε : ℝ, 0 < ε → ∃ n₀ : ℕ, ∀ n : ℕ, n₀ ≤ n → ∀ 𝓕 : Finset (Finset (Fin n)), (𝓕.card : ℝ) ≤ (2 - ε) * (2 : ℝ) ^ ((n : ℝ) / 2) → comparableEdges 𝓕 < 2 ^ n) := by
  sorry

end Erdos777
