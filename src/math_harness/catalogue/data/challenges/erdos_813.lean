import Mathlib

open Filter Asymptotics

namespace Erdos813

def EverySevenHasTriangle {n : ℕ} (G : SimpleGraph (Fin n)) : Prop :=
  ∀ S : Finset (Fin n), S.card = 7 → ∃ t ⊆ S, G.IsNClique 3 t

noncomputable def h (n : ℕ) : ℕ :=
  sInf {k : ℕ | ∃ G : SimpleGraph (Fin n), EverySevenHasTriangle G ∧ G.cliqueNum = k}

theorem everySevenHasTriangle_top (n : ℕ) :
    EverySevenHasTriangle (⊤ : SimpleGraph (Fin n)) := by
  intro S hS
  obtain ⟨t, htS, ht⟩ := Finset.exists_subset_card_eq (show 3 ≤ S.card by omega)
  exact ⟨t, htS, ⟨(SimpleGraph.isClique_univ.2 rfl).subset (Set.subset_univ _), ht⟩⟩

theorem h_seven : h 7 = 3 := by
  -- The triangle on `{0, 1, 2}` together with four isolated vertices.
  set G : SimpleGraph (Fin 7) :=
    { Adj := fun v w => v ≠ w ∧ v.val < 3 ∧ w.val < 3
      symm := by constructor; intro v w h; exact ⟨h.1.symm, h.2.2, h.2.1⟩
      loopless := by constructor; intro v h; exact h.1 rfl } with hG
  have hmem3 : ∀ a : Fin 7, a ∈ ({0, 1, 2} : Finset (Fin 7)) ↔ a.val < 3 := by decide
  have htri : G.IsNClique 3 ({0, 1, 2} : Finset (Fin 7)) := by
    constructor
    · intro a ha b hb hab
      exact ⟨hab, (hmem3 a).1 ha, (hmem3 b).1 hb⟩
    · decide
  have hclique : G.cliqueNum = 3 := by
    refine le_antisymm ?_ (htri.card_eq ▸ htri.isClique.card_le_cliqueNum)
    obtain ⟨s, hs⟩ := G.exists_isNClique_cliqueNum
    rw [← hs.card_eq]
    by_cases hcard : s.card ≤ 1
    · omega
    · have hsub : s ⊆ ({0, 1, 2} : Finset (Fin 7)) := by
        intro v hv
        obtain ⟨w, hw, hne⟩ := Finset.exists_mem_ne (by omega : 1 < s.card) v
        exact (hmem3 v).2 (hs.isClique hv hw hne.symm).2.1
      simpa using Finset.card_le_card hsub
  have hESH : EverySevenHasTriangle G := by
    intro S hS
    have hU : S = Finset.univ := S.eq_univ_of_card (by simp [hS])
    exact ⟨{0, 1, 2}, hU ▸ Finset.subset_univ _, htri⟩
  have h3 : (3 : ℕ) ∈
      {k : ℕ | ∃ G : SimpleGraph (Fin 7), EverySevenHasTriangle G ∧ G.cliqueNum = k} :=
    ⟨G, hESH, hclique⟩
  refine le_antisymm (Nat.sInf_le h3) (le_csInf ⟨3, h3⟩ ?_)
  rintro k ⟨G', hG', rfl⟩
  obtain ⟨t, -, ht⟩ := hG' Finset.univ (by simp)
  exact ht.card_eq ▸ ht.isClique.card_le_cliqueNum

theorem erdos_813 :
    ∃ c₁ > (0 : ℝ), ∃ c₂ > (0 : ℝ), (fun n : ℕ ↦ (n : ℝ) ^ (1 / 3 + c₁ : ℝ)) =O[atTop] (fun n ↦ (h n : ℝ)) ∧ (fun n : ℕ ↦ (h n : ℝ)) =O[atTop] (fun n : ℕ ↦ (n : ℝ) ^ (1 / 2 - c₂ : ℝ)) := by
  sorry

end Erdos813
