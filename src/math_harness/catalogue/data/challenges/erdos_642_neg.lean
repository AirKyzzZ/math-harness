import Mathlib

open Filter

namespace Erdos642

def CyclesHaveMoreVerticesThanChords {V : Type*} (G : SimpleGraph V) : Prop :=
  ∀ (v : V) (c : G.Walk v v), c.IsCycle → {e : Sym2 V | c.IsChord e}.ncard < c.length

open scoped Classical in
noncomputable def maxEdges (n : ℕ) : ℕ :=
  (Finset.univ.filter fun G : SimpleGraph (Fin n) => CyclesHaveMoreVerticesThanChords G).sup
    fun G => G.edgeSet.ncard

theorem erdos_642_neg :
    ¬ ((fun n : ℕ => (maxEdges n : ℝ)) =O[atTop] (fun n : ℕ => (n : ℝ))) := by
  sorry

theorem cyclesHaveMoreVerticesThanChords_of_isAcyclic {V : Type*} {G : SimpleGraph V}
    (hG : G.IsAcyclic) : CyclesHaveMoreVerticesThanChords G :=
  fun _ c hc => absurd hc (hG c)

open scoped Classical in
theorem le_maxEdges {n : ℕ} (G : SimpleGraph (Fin n))
    (hG : CyclesHaveMoreVerticesThanChords G) : G.edgeSet.ncard ≤ maxEdges n := by
  unfold maxEdges
  exact Finset.le_sup (f := fun H : SimpleGraph (Fin n) => H.edgeSet.ncard)
    (Finset.mem_filter.2 ⟨Finset.mem_univ G, hG⟩)

theorem exists_maxEdges (n : ℕ) :
    ∃ G : SimpleGraph (Fin n), CyclesHaveMoreVerticesThanChords G ∧
      G.edgeSet.ncard = maxEdges n := by
  classical
  have hne : (Finset.univ.filter fun G : SimpleGraph (Fin n) =>
      CyclesHaveMoreVerticesThanChords G).Nonempty := by
    refine ⟨⊥, Finset.mem_filter.2 ⟨Finset.mem_univ _, ?_⟩⟩
    exact cyclesHaveMoreVerticesThanChords_of_isAcyclic SimpleGraph.isAcyclic_bot
  obtain ⟨G, hG, hmax⟩ := Finset.exists_mem_eq_sup _ hne (fun G => G.edgeSet.ncard)
  exact ⟨G, (Finset.mem_filter.1 hG).2, hmax.symm⟩

theorem maxEdges_le_choose_two (n : ℕ) : maxEdges n ≤ n.choose 2 := by
  classical
  obtain ⟨G, _, hG⟩ := exists_maxEdges n
  rw [← hG]
  simpa only [SimpleGraph.edgeFinset, Set.ncard_eq_toFinset_card', Fintype.card_fin] using
    G.card_edgeFinset_le_card_choose_two

theorem maxEdges_zero : maxEdges 0 = 0 := by
  have := maxEdges_le_choose_two 0
  simpa using this

theorem isBigO_iff_uniform_edge_bound :
    ((fun n : ℕ => (maxEdges n : ℝ)) =O[atTop] (fun n : ℕ => (n : ℝ))) ↔
      ∃ C : ℝ, ∀ (n : ℕ) (G : SimpleGraph (Fin n)),
        CyclesHaveMoreVerticesThanChords G → (G.edgeSet.ncard : ℝ) ≤ C * n := by
  have hzero : ∀ n : ℕ, (n : ℝ) = 0 → (maxEdges n : ℝ) = 0 := by
    intro n hn
    have : n = 0 := by exact_mod_cast hn
    simp [this, maxEdges_zero]
  rw [Asymptotics.isBigO_nat_atTop_iff hzero]
  simp only [Real.norm_natCast]
  constructor
  · rintro ⟨C, hC⟩
    refine ⟨C, fun n G hG => ?_⟩
    exact (Nat.cast_le.2 (le_maxEdges G hG)).trans (hC n)
  · rintro ⟨C, hC⟩
    refine ⟨C, fun n => ?_⟩
    obtain ⟨G, hG, hmax⟩ := exists_maxEdges n
    simpa [hmax] using hC n G hG

end Erdos642
