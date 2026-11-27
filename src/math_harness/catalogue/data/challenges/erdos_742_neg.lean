import Mathlib

open SimpleGraph

namespace Erdos742

variable {V : Type*} [Fintype V] [DecidableEq V]

def IsDiameter2Critical (G : SimpleGraph V) : Prop :=
  G.diam = 2 ∧ ∀ e ∈ G.edgeSet, (G.deleteEdges {e}).diam ≠ 2

theorem erdos_742_neg :
    ¬ (∀ (V : Type*) [Fintype V] [DecidableEq V] (G : SimpleGraph V) [DecidableRel G.Adj], IsDiameter2Critical G → G.edgeFinset.card ≤ (Fintype.card V) ^ 2 / 4) := by
  sorry

theorem complete_bipartite_edge_count (a b : ℕ) :
    (completeBipartiteGraph (Fin a) (Fin b)).edgeSet.ncard = a * b := by
  -- The edge set equals the image of `Fin a × Fin b` under the map
  -- `(i, j) ↦ s(Sum.inl i, Sum.inr j)`.
  let φ : Fin a × Fin b → Sym2 (Fin a ⊕ Fin b) :=
    fun p => s(Sum.inl p.1, Sum.inr p.2)
  have hedge : (completeBipartiteGraph (Fin a) (Fin b)).edgeSet = φ '' Set.univ := by
    ext e
    simp only [φ, Set.mem_image, Set.mem_univ, true_and]
    constructor
    · intro hadj
      induction e using Quot.ind
      rename_i p
      cases p with | mk a b =>
      cases a <;> cases b <;> simp_all [completeBipartiteGraph]
    · rintro ⟨⟨i, j⟩, rfl⟩
      simp [completeBipartiteGraph]
  have hinj : Function.Injective φ := by
    intro ⟨i₁, j₁⟩ ⟨i₂, j₂⟩ h
    simp only [φ, Sym2.eq_iff] at h
    rcases h with ⟨h1, h2⟩ | ⟨h1, _⟩
    · exact Prod.ext (Sum.inl.inj h1) (Sum.inr.inj h2)
    · exact absurd h1 (by simp)
  rw [hedge, Set.ncard_image_of_injective _ hinj, Set.ncard_univ,
    Nat.card_prod, Nat.card_fin, Nat.card_fin]

namespace variants

end variants

end Erdos742
