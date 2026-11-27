import Mathlib

open Filter SimpleGraph

namespace Erdos426

theorem isUniqueSubgraph_bot_bot {V : Type*} : IsUniqueSubgraph (⊥ : SimpleGraph V) ⊥ := by
  refine ⟨⊥, ⟨le_refl _, ⟨Iso.refl⟩⟩, ?_⟩
  rintro G' ⟨hle, -⟩
  exact le_bot_iff.mp hle

theorem erdos_426 :
    ¬ ∃ c : ℝ, 0 < c ∧ ∃ᶠ (n : ℕ) in atTop, ∃ H : SimpleGraph (Fin n), c * ((2 : ℝ) ^ n.choose 2 / n.factorial) ≤ (uniqueSubgraphCount H : ℝ) := by
  sorry

end Erdos426
