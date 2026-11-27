import Mathlib

open Filter SimpleGraph

namespace Erdos22

open scoped Classical in
theorem erdos_22 :
    ∀ ε : ℝ, 0 < ε → ∀ᶠ (n : ℕ) in atTop, ∃ G : SimpleGraph (Fin n), G.CliqueFree 4 ∧ (G.indepNum : ℝ) ≤ ε * n ∧ (n : ℝ) ^ 2 / 8 ≤ G.edgeFinset.card := by
  sorry

theorem erdos_22.variants.test_bot (n : ℕ) (ε : ℝ) (hε : 0 < ε) :
    (⊥ : SimpleGraph (Fin n)).CliqueFree 4 ∧
      (((⊥ : SimpleGraph (Fin n)).edgeFinset.card : ℝ)) ≤ (1 / 8 + ε) * n ^ 2 := by
  refine ⟨cliqueFree_bot (by norm_num), ?_⟩
  rw [edgeFinset_bot]
  simp only [Finset.card_empty, Nat.cast_zero]
  positivity

end Erdos22
