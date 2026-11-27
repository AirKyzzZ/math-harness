import Mathlib

open Cardinal SimpleGraph

namespace Erdos1175

theorem erdos_1175.variants.threshold_formulation :
    ∀ (κ : Cardinal), ℵ₀ < κ → ∃ (μ : Cardinal), ∀ (V : Type*) (G : SimpleGraph V), μ ≤ G.chromaticCardinal → ∃ (H : G.Subgraph), H.coe.CliqueFree 3 ∧ H.coe.chromaticCardinal = κ := by
  sorry

theorem erdos_1175.test.exists_triangle_free_subgraph
    (V : Type*) (G : SimpleGraph V) : ∃ H : G.Subgraph, H.coe.CliqueFree 3 :=
  ⟨⊥, by simp [SimpleGraph.cliqueFree_bot (by norm_num : 2 ≤ 3)]⟩

theorem erdos_1175.test.threshold_implies_exact :
    (∀ (κ : Cardinal.{0}), ℵ₀ < κ →
      ∃ (μ : Cardinal.{0}),
        ∀ (V : Type) (G : SimpleGraph V), μ ≤ G.chromaticCardinal →
          ∃ (H : G.Subgraph), H.coe.CliqueFree 3 ∧ H.coe.chromaticCardinal = κ) →
    (∀ (κ : Cardinal.{0}), ℵ₀ < κ →
      ∃ (μ : Cardinal.{0}),
        ∀ (V : Type) (G : SimpleGraph V), G.chromaticCardinal = μ →
          ∃ (H : G.Subgraph), H.coe.CliqueFree 3 ∧ H.coe.chromaticCardinal = κ) := by
  intro h κ hκ
  obtain ⟨μ, hμ⟩ := h κ hκ
  exact ⟨μ, fun V G hG => hμ V G hG.ge⟩

end Erdos1175
