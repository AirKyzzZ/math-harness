import Mathlib

open Cardinal Set SimpleGraph

namespace Erdos593

theorem erdos_593.variants.obligatory_implies_two_colorable_neg :
    ¬ (∀ (W : Type) [Fintype W] (F : UniformHypergraph W 3), F.IsObligatory → F.IsNColorable 2) := by
  sorry

def commonPair : UniformHypergraph (Fin 4) 3 :=
  UniformHypergraph.ofFinset {{0, 1, 2}, {0, 1, 3}} (by unfold Finset.IsUniform; decide)

theorem erdos_593.variants.commonPair_isTwoColorable : commonPair.IsNColorable 2 :=
  ⟨fun i => if i.val < 2 then 0 else 1, by
    exact (UniformHypergraph.isProperColoring_ofFinset_iff
      ({{0, 1, 2}, {0, 1, 3}} : Finset (Finset (Fin 4)))
      (by unfold Finset.IsUniform; decide) _).mpr (by unfold Finset.IsProperHypergraphColoring; decide)⟩

theorem erdos_593.variants.graph_case_bipartite_obligatory :
    ∀ (V : Type*) (G : SimpleGraph V),
      ℵ₀ < G.chromaticCardinal →
      ∀ (W : Type*) [Fintype W] (F : SimpleGraph W), F.IsBipartite →
        F ⊑ G := by
  -- This is the Erdős–Galvin–Hajnal theorem [EGH75].
  sorry

theorem erdos_593.variants.graph_case_no_odd_cycle :
    ∀ k : ℕ, Odd k → 3 ≤ k →
      ∃ (V : Type*) (G : SimpleGraph V),
        G.chromaticCardinal = ℵ_ 1 ∧
        IsEmpty (cycleGraph k →g G) := by
  -- This is the Erdős–Galvin–Hajnal theorem [EGH75].
  sorry

theorem erdos_593.variants.uncountable_vertices_if_large_chromatic
    {V : Type} (H : UniformHypergraph V 3) (hχ : ℵ₀ < H.chromaticCardinal) :
    ¬ Countable V := by
  intro hcount
  -- Since V is countable, there is an injection φ : V → ℕ.
  obtain ⟨φ, hφ⟩ := Countable.exists_injective_nat V
  have hprop := H.isProperColoring_of_injective (by decide) hφ
  have hle : H.chromaticCardinal ≤ ℵ₀ := by
    simpa using H.chromaticCardinal_le hprop
  exact absurd (lt_of_lt_of_le hχ hle) (lt_irrefl _)

theorem erdos_593.variants.nonempty_edges_if_large_chromatic
    {V : Type} (H : UniformHypergraph V 3) (hχ : ℵ₀ < H.chromaticCardinal) :
    H.edgeSet.Nonempty := by
  by_contra! hempty
  -- H has no edges (hempty : H.edgeSet = ∅), so any coloring is proper.
  have hprop : H.IsProperColoring (fun _ : V => (0 : Fin 1)) := by
    intro e he
    rw [hempty] at he
    exact (Set.mem_empty_iff_false e).mp he |>.elim
  -- Hence χ(H) ≤ 1 < ℵ₀.
  have hle : H.chromaticCardinal ≤ 1 := by
    simpa using H.chromaticCardinal_le hprop
  have h1le : (1 : Cardinal) ≤ ℵ₀ := le_of_lt Cardinal.one_lt_aleph0
  exact absurd (lt_of_lt_of_le hχ (hle.trans h1le)) (lt_irrefl _)

theorem erdos_593.variants.obligatory_monotone
    {W₁ W₂ : Type} [Fintype W₁] [Fintype W₂] [DecidableEq W₂]
    {F₁ : UniformHypergraph W₁ 3} {F₂ : UniformHypergraph W₂ 3}
    (h12 : F₁.Appears F₂) (hObl : F₂.IsObligatory) :
    F₁.IsObligatory := by
  intro V _hV H hχ
  exact h12.trans (hObl V H hχ)

theorem erdos_593.variants.empty_hypergraph_obligatory :
    UniformHypergraph.IsObligatory (W := PEmpty) (k := 3)
      (UniformHypergraph.ofFinset ∅ (by simp [Finset.IsUniform])) := by
  intro V _hV H _hχ
  exact ⟨IsEmpty.elim inferInstance, Function.injective_of_subsingleton _,
    by simp [UniformHypergraph.ofFinset, Hypergraph.ofEdgeFamily, Hypergraph.image]⟩

end Erdos593
