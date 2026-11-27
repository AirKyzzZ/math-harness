import Mathlib

namespace Erdos643

open Filter Asymptotics

noncomputable def forcingThreshold (n t : ℕ) : ℕ :=
  Hypergraph.extremalNumber n t (fun H ↦ ¬ H.HasRepeatedDisjointUnion) + 1

theorem erdos_643.variants.exact_t_ge_four :
    ∀ t : ℕ, 4 ≤ t → ∀ᶠ n : ℕ in atTop, Hypergraph.extremalNumber n t (fun H ↦ ¬ H.HasRepeatedDisjointUnion) = (n - 1).choose (t - 1) + (n - 1) / t := by
  sorry

theorem exists_avoiding_maximizer (n t : ℕ) :
    ∃ H : Finset (Finset (Fin n)), H.IsUniform t ∧ ¬ H.HasRepeatedDisjointUnion ∧
      H.card + 1 = forcingThreshold n t := by
  classical
  let S := ((Finset.univ : Finset (Fin n)).powersetCard t).powerset.filter
    fun H ↦ ¬ H.HasRepeatedDisjointUnion
  have hne : S.Nonempty := by
    refine ⟨∅, ?_⟩
    simp [S, Finset.HasRepeatedDisjointUnion]
  obtain ⟨H, hH, hmax⟩ := Finset.exists_mem_eq_sup S hne Finset.card
  have hmem := Finset.mem_filter.1 hH
  refine ⟨H, ?_, hmem.2, ?_⟩
  · intro e he
    exact (Finset.mem_powersetCard.1 (Finset.mem_powerset.1 hmem.1 he)).2
  · unfold forcingThreshold
    apply congrArg (fun k : ℕ ↦ k + 1)
    calc
      H.card = S.sup Finset.card := hmax.symm
      _ = Hypergraph.extremalNumber n t (fun H ↦ ¬ H.HasRepeatedDisjointUnion) := by
        unfold Hypergraph.extremalNumber
        congr 1
        ext K
        simp [S]

theorem forcingThreshold_le_iff (n t m : ℕ) :
    forcingThreshold n t ≤ m ↔
      ∀ H : Finset (Finset (Fin n)), H.IsUniform t →
        m ≤ H.card → H.HasRepeatedDisjointUnion := by
  classical
  constructor
  · intro hm H hHt hcard
    by_contra hfree
    have hmem : H ∈ ((Finset.univ : Finset (Fin n)).powersetCard t).powerset.filter
        (fun H ↦ ¬ H.HasRepeatedDisjointUnion) := by
      refine Finset.mem_filter.2 ⟨Finset.mem_powerset.2 ?_, hfree⟩
      intro e he
      exact Finset.mem_powersetCard.2 ⟨Finset.subset_univ _, hHt e he⟩
    have hmax : H.card < forcingThreshold n t := by
      unfold forcingThreshold
      apply Nat.lt_succ_of_le
      unfold Hypergraph.extremalNumber
      apply Finset.le_sup
      simpa using hmem
    omega
  · intro hm
    obtain ⟨H, hHt, hfree, hmax⟩ := exists_avoiding_maximizer n t
    by_contra hlt
    exact hfree (hm H hHt (by omega))

theorem forcingThreshold_eq_one_of_lt {n t : ℕ} (h : n < t) :
    forcingThreshold n t = 1 := by
  classical
  have hempty : (Finset.univ : Finset (Fin n)).powersetCard t = ∅ :=
    Finset.powersetCard_eq_empty.2 (by simpa using h)
  simp [forcingThreshold, Hypergraph.extremalNumber, hempty, Finset.HasRepeatedDisjointUnion]

end Erdos643
