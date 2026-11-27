import Mathlib

open Filter SimpleGraph

namespace Erdos22

open scoped Classical in
theorem erdos_22.variants.szemeredi_upper (ε : ℝ) (hε : 0 < ε) :
    ∃ δ : ℝ, 0 < δ ∧ ∀ᶠ (n : ℕ) in atTop, ∀ G : SimpleGraph (Fin n), G.CliqueFree 4 → (G.indepNum : ℝ) ≤ δ * n → (G.edgeFinset.card : ℝ) ≤ (1 / 8 + ε) * n ^ 2 := by
  sorry

theorem erdos_22.variants.test_bot (n : ℕ) (ε : ℝ) (hε : 0 < ε) :
    (⊥ : SimpleGraph (Fin n)).CliqueFree 4 ∧
      (((⊥ : SimpleGraph (Fin n)).edgeFinset.card : ℝ)) ≤ (1 / 8 + ε) * n ^ 2 := by
  refine ⟨cliqueFree_bot (by norm_num), ?_⟩
  rw [edgeFinset_bot]
  simp only [Finset.card_empty, Nat.cast_zero]
  positivity

end Erdos22
