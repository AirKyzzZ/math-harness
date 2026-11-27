import Mathlib

open SimpleGraph

namespace Erdos619

noncomputable def minNewEdges {V : Type*} (r : ℕ) (G : SimpleGraph V) : ℕ :=
  sInf {k | ∃ H : SimpleGraph V,
    G ≤ H ∧ H.CliqueFree 3 ∧ H.ediam ≤ r ∧ (H \ G).edgeSet.ncard = k}

theorem erdos_619.variants.h_three_lower :
    ∃ c > (0 : ℝ), ∀ n : ℕ, 0 < n → ∃ (V : Type) (_ : Fintype V) (G : SimpleGraph V), Fintype.card V = n ∧ G.Connected ∧ G.CliqueFree 3 ∧ (n : ℝ) - c ≤ minNewEdges 3 G := by
  sorry

theorem erdos_619.test.minNewEdges_eq_zero {V : Type*} {r : ℕ} {G : SimpleGraph V}
    (hG : G.CliqueFree 3) (hdiam : G.ediam ≤ r) :
    minNewEdges r G = 0 :=
  Nat.sInf_eq_zero.mpr <| Or.inl ⟨G, le_rfl, hG, hdiam, by simp⟩

theorem erdos_619.test.minNewEdges_singleton :
    minNewEdges 4 (⊥ : SimpleGraph (Fin 1)) = 0 :=
  erdos_619.test.minNewEdges_eq_zero (cliqueFree_bot (by norm_num))
    (by simp [ediam_eq_zero_of_subsingleton])

end Erdos619
