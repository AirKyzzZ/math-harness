import Mathlib

open SimpleGraph Set

namespace Erdos595

def IsCountableUnionOfTriangleFree {V : Type*} (G : SimpleGraph V) : Prop :=
  ∃ H : ℕ → SimpleGraph V, (∀ i, (H i).CliqueFree 3) ∧ G = ⨆ i, H i

theorem erdos_595_neg :
    ¬ (∃ (V : Type*) (_ : Infinite V) (G : SimpleGraph V), G.CliqueFree 4 ∧ ¬IsCountableUnionOfTriangleFree G) := by
  sorry

theorem erdos_595.variants.folkman_finite :
    ∀ n : ℕ, 1 ≤ n →
    ∃ (V : Type*) (_ : Fintype V) (G : SimpleGraph V),
      G.CliqueFree 4 ∧
      ∀ (H : Fin n → SimpleGraph V), (∀ i, (H i).CliqueFree 3) → G ≠ ⨆ i, H i := by
  -- Folkman [Fo70] and Nešetřil–Rödl [NeRo75]: explicit construction exists.
  sorry

theorem erdos_595.variants.subgraph_of_countable_union
    {V : Type*} {G H : SimpleGraph V}
    (hH : H ≤ G) (hG : IsCountableUnionOfTriangleFree G) :
    IsCountableUnionOfTriangleFree H := by
  obtain ⟨f, hf_free, hf_eq⟩ := hG
  refine ⟨fun i => H ⊓ f i, fun i => (hf_free i).anti inf_le_right, ?_⟩
  ext a b
  simp only [iSup_adj, inf_adj]
  constructor
  · intro hab
    have habG : G.Adj a b := hH hab
    rw [hf_eq, iSup_adj] at habG
    obtain ⟨i, hi⟩ := habG
    exact ⟨i, hab, hi⟩
  · rintro ⟨i, hHab, _⟩
    exact hHab

theorem erdos_595.variants.triangle_free_is_union
    {V : Type*} (G : SimpleGraph V) (hG : G.CliqueFree 3) :
    IsCountableUnionOfTriangleFree G := by
  refine ⟨fun i => if i = 0 then G else ⊥, fun i => ?_, ?_⟩
  · by_cases h : i = 0
    · simp [h, hG]
    · simp [h, cliqueFree_bot (by norm_num : 2 ≤ 3)]
  · ext a b
    simp only [iSup_adj]
    constructor
    · intro hab
      exact ⟨0, by simp [hab]⟩
    · rintro ⟨i, hi⟩
      by_cases h : i = 0
      · simp [h] at hi; exact hi
      · simp [h] at hi

theorem erdos_595.variants.complete_nat_is_union :
    IsCountableUnionOfTriangleFree (⊤ : SimpleGraph ℕ) := by
  -- Star at m: edges are all {a, b} where a = m or b = m (and a ≠ b, by SimpleGraph.fromRel).
  refine ⟨fun m => SimpleGraph.fromRel (fun (a b : ℕ) => a = m ∨ b = m),
          fun m => ?_, ?_⟩
  · -- Each star H_m is triangle-free.
    rw [CliqueFree]
    intro s hs
    simp only [isNClique_iff] at hs
    obtain ⟨hs_clique, hs_card⟩ := hs
    rw [isClique_iff] at hs_clique
    obtain ⟨a, b, c, hab, hac, hbc, hs_eq⟩ := Finset.card_eq_three.mp hs_card
    -- Extract membership in s.
    have ha : a ∈ s := hs_eq ▸ Finset.mem_insert_self a _
    have hb : b ∈ s := hs_eq ▸ Finset.mem_insert.mpr
                        (Or.inr (Finset.mem_insert_self b _))
    have hc : c ∈ s := hs_eq ▸ Finset.mem_insert.mpr
                        (Or.inr (Finset.mem_insert.mpr (Or.inr (Finset.mem_singleton_self c))))
    -- Each pair is adjacent in H_m.
    have hab_adj := hs_clique ha hb hab
    have hac_adj := hs_clique ha hc hac
    have hbc_adj := hs_clique hb hc hbc
    -- fromRel_adj: (fromRel r).Adj x y ↔ x ≠ y ∧ (r x y ∨ r y x)
    -- For r x y = (x = m ∨ y = m): r x y ∨ r y x simplifies to x = m ∨ y = m.
    simp only [fromRel_adj] at hab_adj hac_adj hbc_adj
    -- Extract "a = m or b = m", "a = m or c = m", "b = m or c = m".
    have ham_or_bm : a = m ∨ b = m := hab_adj.2.elim id Or.symm
    have ham_or_cm : a = m ∨ c = m := hac_adj.2.elim id Or.symm
    have hbm_or_cm : b = m ∨ c = m := hbc_adj.2.elim id Or.symm
    -- Case analysis: whichever vertex equals m forces another to equal m as well,
    -- contradicting distinctness.
    rcases ham_or_bm with rfl | rfl
    · -- a = m
      rcases hbm_or_cm with rfl | rfl
      · exact absurd rfl hab   -- b = a = m
      · exact absurd rfl hac   -- c = a = m
    · -- b = m
      rcases ham_or_cm with rfl | rfl
      · exact hab.symm rfl  -- a = b = m, so a = m and b = m, contradiction
      · exact hbc rfl       -- c = b = m, so b = c, contradiction
  · -- The union ⨆ m, H_m equals ⊤.
    ext a b
    simp only [iSup_adj, fromRel_adj, top_adj]
    -- Goal: a ≠ b ↔ ∃ m, a ≠ b ∧ ((a = m ∨ b = m) ∨ (b = m ∨ a = m))
    exact ⟨fun hab => ⟨a, hab, Or.inl (Or.inl rfl)⟩,
           fun ⟨_, hne, _⟩ => hne⟩

theorem erdos_595.variants.K4_not_cliqueFree :
    ¬ (⊤ : SimpleGraph (Fin 4)).CliqueFree 4 := by
  rw [SimpleGraph.not_cliqueFree_iff_top_isContained]
  exact IsContained.of_le fun ⦃v w⦄ a ↦ a

theorem erdos_595.variants.reformulation_edge_colouring {V : Type*} (G : SimpleGraph V) :
    IsCountableUnionOfTriangleFree G ↔
    ∃ c : G.edgeSet → ℕ,
      ∀ n : ℕ,
        (SimpleGraph.fromEdgeSet {e | ∃ h : e ∈ G.edgeSet, c ⟨e, h⟩ = n}).CliqueFree 3 := by
  -- Note: `c : G.edgeSet → ℕ` is exactly `EdgeLabeling G ℕ`, and the `fromEdgeSet` expression
  -- is exactly `EdgeLabeling.labelGraph c n`. We use `EdgeLabeling.iSup_labelGraph` for (←).
  constructor
  · -- (→): Given H : ℕ → SimpleGraph V with G = ⨆ H i and each H i triangle-free,
    -- construct c : G.edgeSet → ℕ by choosing some i containing each edge classically.
    rintro ⟨H, hH_free, hH_eq⟩
    -- For each edge e = s(a,b) of G, use iSup_adj to find some H i containing it.
    -- We use Sym2.ind to destructure e into s(a,b) form and then apply mem_edgeSet + iSup_adj.
    have hcov : ∀ e : G.edgeSet, ∃ i, (e : Sym2 V) ∈ (H i).edgeSet :=
      fun ⟨e, he⟩ => Sym2.ind (fun a b he => by
        rw [hH_eq, mem_edgeSet, iSup_adj] at he
        exact he.imp fun i hi => hi) e he
    -- Define c by classical choice of the covering index.
    refine ⟨fun e => (hcov e).choose, fun n => ?_⟩
    -- Show the subgraph of edges coloured n is a subgraph of H n, hence triangle-free.
    apply (hH_free n).anti
    intro x y hxy
    rw [fromEdgeSet_adj] at hxy
    obtain ⟨⟨h_mem, h_eq⟩, _⟩ := hxy
    -- h_eq : (hcov ⟨s(x,y), h_mem⟩).choose = n
    -- choose_spec gives s(x,y) ∈ (H (choose)).edgeSet; after rewriting with h_eq, in H n.
    have hspec := (hcov ⟨s(x, y), h_mem⟩).choose_spec
    simp only [h_eq] at hspec
    exact hspec
  · -- (←): Given c : G.edgeSet → ℕ, define H n = fromEdgeSet {e | ∃ h, c ⟨e,h⟩ = n}.
    -- This is EdgeLabeling.labelGraph c n, so ⨆ n, H n = G by iSup_labelGraph.
    rintro ⟨c, hc⟩
    refine ⟨fun n => SimpleGraph.fromEdgeSet {e | ∃ h : e ∈ G.edgeSet, c ⟨e, h⟩ = n},
            hc, ?_⟩
    -- G = ⨆ n, (labelGraph c n) follows from EdgeLabeling.iSup_labelGraph.
    exact (EdgeLabeling.iSup_labelGraph (G := G) c).symm

end Erdos595
