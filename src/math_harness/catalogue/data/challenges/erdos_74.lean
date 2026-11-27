import Mathlib

open Filter SimpleGraph

open scoped Topology Real

namespace Erdos74

open Erdos74

universe u

variable {V : Type u}

def SimpleGraph.edgeDistancesToBipartite {G : SimpleGraph V} (A : G.Subgraph) : Set ℕ :=
  { (E.ncard) | (E : Set (Sym2 V)) (_ : E ⊆ A.edgeSet) (_ : IsBipartite (A.deleteEdges E).coe)}

set_option backward.isDefEq.respectTransparency false in
theorem SimpleGraph.edgeDistancesToBipartite_nonempty {G : SimpleGraph V} (A : G.Subgraph) :
    SimpleGraph.edgeDistancesToBipartite A |>.Nonempty := by
  dsimp only [edgeDistancesToBipartite,Set.nonempty_def]
  refine ⟨_, A.edgeSet, fun _ a ↦ a, ?_, rfl⟩
  use fun _ => 0
  simp

noncomputable def SimpleGraph.minEdgeDistToBipartite {G : SimpleGraph V} (A : G.Subgraph) : ℕ :=
  sInf <| SimpleGraph.edgeDistancesToBipartite A

def SimpleGraph.subgraphEdgeDistsToBipartite (G : SimpleGraph V) (n : ℕ) : Set ℕ :=
  { (SimpleGraph.minEdgeDistToBipartite A) |
    (A : Subgraph G) (_ : A.verts.ncard = n) (_ : A.verts.Finite) }

set_option backward.isDefEq.respectTransparency false in
theorem SimpleGraph.subgraphEdgeDistsToBipartite_bddAbove (G : SimpleGraph V) (n : ℕ) :
    BddAbove (SimpleGraph.subgraphEdgeDistsToBipartite G n) := by
  use n.choose 2
  simp only [upperBounds, Set.mem_ofPred_eq, SimpleGraph.subgraphEdgeDistsToBipartite,
    SimpleGraph.minEdgeDistToBipartite, SimpleGraph.edgeDistancesToBipartite]
  intro m h
  replace ⟨A, ⟨hn, h_fin, h⟩⟩ := h
  rw [← h]
  have : A.edgeSet.ncard ≤ n.choose 2 := by
    rw [← hn]
    have := h_fin.fintype
    have := Fintype.ofFinite ↑A.coe.edgeSet
    convert (A.coe).card_edgeFinset_le_card_choose_two
    · rw [← Set.ncard_coe_finset A.coe.edgeFinset, coe_edgeFinset A.coe, ← Subgraph.image_coe_edgeSet_coe A]
      exact (Set.ncard_image_iff (Set.toFinite A.coe.edgeSet)).mpr <|
        Function.Injective.injOn <| Sym2.map.injective Subtype.coe_injective
    · rw [Set.ncard_eq_toFinset_card _ h_fin, Set.Finite.card_toFinset]
  refine le_trans ?_ this
  apply Nat.sInf_le
  simp only [Subgraph.deleteEdges_verts, exists_prop, Set.mem_ofPred_eq]
  use A.edgeSet
  refine ⟨by rfl, ?_, rfl⟩
  use fun _ => 0
  simp

noncomputable def SimpleGraph.maxSubgraphEdgeDistToBipartite
    (G : SimpleGraph V) (n : ℕ) : ℕ := sSup <| SimpleGraph.subgraphEdgeDistsToBipartite G n

theorem erdos_74 :
    ¬ ∀ f : ℕ → ℕ, Tendsto f atTop atTop → (∃ (V : Type u) (G : SimpleGraph V), G.chromaticNumber = ⊤ ∧ ∀ n, G.maxSubgraphEdgeDistToBipartite n ≤ f n) := by
  sorry

-- TODO(firsching): add the remaining statements/comments

end Erdos74
