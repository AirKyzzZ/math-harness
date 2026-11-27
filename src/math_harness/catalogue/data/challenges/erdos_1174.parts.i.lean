import Mathlib

open Cardinal

open scoped Cardinal

namespace Erdos1174

theorem erdos_1174.parts.i :
    ∃ (V : Type) (G : SimpleGraph V), G.CliqueFree 4 ∧ ∀ c : Sym2 V → ℕ, ∃ x y z : V, G.Adj x y ∧ G.Adj y z ∧ G.Adj x z ∧ c s(x, y) = c s(y, z) ∧ c s(y, z) = c s(x, z) := by
  sorry

theorem top_not_cliqueFree_four : ¬ (⊤ : SimpleGraph ℕ).CliqueFree 4 :=
  SimpleGraph.IsContained.not_cliqueFree
    ⟨SimpleGraph.Embedding.toCopy (⟨Fin.valEmbedding, by simp [Fin.val_injective.ne_iff]⟩ :
      SimpleGraph.completeGraph (Fin 4) ↪g (⊤ : SimpleGraph ℕ))⟩

theorem bot_fails_colouring_property :
    ¬ ∀ c : Sym2 ℕ → ℕ, ∃ x y z : ℕ,
        (⊥ : SimpleGraph ℕ).Adj x y ∧ (⊥ : SimpleGraph ℕ).Adj y z ∧
        (⊥ : SimpleGraph ℕ).Adj x z ∧
        c s(x, y) = c s(y, z) ∧ c s(y, z) = c s(x, z) := by
  simp

end Erdos1174
