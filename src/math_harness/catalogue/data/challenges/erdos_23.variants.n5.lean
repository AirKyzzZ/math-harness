import Mathlib

open SimpleGraph BigOperators

namespace Erdos23

open scoped Classical in
theorem erdos_23.variants.n1_tight :
    ∃ (G : SimpleGraph (Fin 5)), G.CliqueFree 3 ∧ ∀ (H : SimpleGraph (Fin 5)),
        H ≤ G → H.IsBipartite → 1 ≤ (G.edgeFinset \ H.edgeFinset).card := by
  -- The `5`-cycle is triangle-free, and a bipartite subgraph missing no edge would be the
  -- `5`-cycle itself, which has chromatic number `3`.
  refine ⟨cycleGraph 5, by unfold CliqueFree; decide +kernel, fun H hHG hH => ?_⟩
  by_contra hcon
  have h0 := Finset.card_eq_zero.1 (Nat.lt_one_iff.1 (not_le.1 hcon))
  have hsub := Finset.sdiff_eq_empty_iff_subset.1 h0
  rw [Finset.subset_iff] at hsub
  simp only [mem_edgeFinset] at hsub
  have hGH : cycleGraph 5 ≤ H := edgeSet_subset_edgeSet.1 fun _ he => hsub he
  obtain rfl : H = cycleGraph 5 := le_antisymm hHG hGH
  have h2 := hH.chromaticNumber_le
  rw [chromaticNumber_cycleGraph_of_odd 5 (by norm_num) (by decide)] at h2
  exact absurd h2 (by decide)

open scoped Classical in
theorem erdos_23.variants.n5 :
    ∀ (G : SimpleGraph (Fin 25)), G.CliqueFree 3 → ∃ (H : SimpleGraph (Fin 25)), H ≤ G ∧ H.IsBipartite ∧ (G.edgeFinset \ H.edgeFinset).card ≤ 25 := by
  sorry

def blowupC5 (n : ℕ) : SimpleGraph (ZMod 5 × Fin n) :=
  SimpleGraph.fromRel fun (i, _) (j, _) => i + 1 = j ∨ j + 1 = i

-- TODO: add the remaining variants/statements/comments

end Erdos23
