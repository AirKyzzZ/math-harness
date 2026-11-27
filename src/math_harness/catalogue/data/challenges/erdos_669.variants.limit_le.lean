import Mathlib

open Filter

open scoped Topology EuclideanGeometry

namespace Erdos669

noncomputable def linesWithAtLeastPointsFor (k : ℕ) (S : Set ℝ²) : Set (AffineSubspace ℝ ℝ²) :=
  let determined_lines := { affineSpan ℝ {p, q} | (p ∈ S) (q ∈ S) (_ : p ≠ q) }
  { L ∈ determined_lines | k ≤ (↑L ∩ S).ncard }

noncomputable def lineCountsAtLeast (k n : ℕ) : Set ℕ :=
  {m | ∃ S : Finset ℝ², S.card = n ∧ (linesWithAtLeastPointsFor k (S : Set ℝ²)).ncard = m}

noncomputable def lineCountsExactly (k n : ℕ) : Set ℕ :=
  {m | ∃ S : Finset ℝ², S.card = n ∧
    (EuclideanGeometry.linesWithPointsFor k (S : Set ℝ²)).ncard = m}

private lemma ncard_le_sq (S : Finset ℝ²) (T : Set (AffineSubspace ℝ ℝ²))
    (hT : ∀ L ∈ T, ∃ p ∈ S, ∃ q ∈ S, affineSpan ℝ {p, q} = L) : T.ncard ≤ S.card ^ 2 := by
  have hfin : ((S : Set ℝ²) ×ˢ (S : Set ℝ²)).Finite := S.finite_toSet.prod S.finite_toSet
  have hcard : ((S : Set ℝ²) ×ˢ (S : Set ℝ²)).ncard = S.card ^ 2 := by
    rw [Set.ncard_prod, Set.ncard_coe_finset, sq]
  have hsub : T ⊆ (fun pq : ℝ² × ℝ² => affineSpan ℝ {pq.1, pq.2}) ''
      ((S : Set ℝ²) ×ˢ (S : Set ℝ²)) := by
    intro L hL
    obtain ⟨p, hp, q, hq, rfl⟩ := hT L hL
    exact ⟨(p, q), Set.mk_mem_prod (Finset.mem_coe.2 hp) (Finset.mem_coe.2 hq), rfl⟩
  exact (Set.ncard_le_ncard hsub (hfin.image _)).trans
    ((Set.ncard_image_le hfin).trans hcard.le)

theorem lineCountsAtLeast_bddAbove (k n : ℕ) : BddAbove (lineCountsAtLeast k n) := by
  refine ⟨n ^ 2, ?_⟩
  rintro _ ⟨S, rfl, rfl⟩
  refine ncard_le_sq S _ ?_
  rintro L ⟨⟨p, hp, q, hq, -, rfl⟩, -⟩
  exact ⟨p, Finset.mem_coe.1 hp, q, Finset.mem_coe.1 hq, rfl⟩

theorem lineCountsExactly_bddAbove (k n : ℕ) : BddAbove (lineCountsExactly k n) := by
  refine ⟨n ^ 2, ?_⟩
  rintro _ ⟨S, rfl, rfl⟩
  refine ncard_le_sq S _ ?_
  rintro L ⟨⟨p, hp, q, hq, -, rfl⟩, -⟩
  exact ⟨p, Finset.mem_coe.1 hp, q, Finset.mem_coe.1 hq, rfl⟩

theorem linesWithPointsFor_subset_linesWithAtLeastPointsFor (k : ℕ) (S : Set ℝ²) :
    EuclideanGeometry.linesWithPointsFor k S ⊆ linesWithAtLeastPointsFor k S := by
  rintro L ⟨hL, hk⟩
  exact ⟨hL, hk.ge⟩

noncomputable def maxLinesAtLeast (k n : ℕ) : ℕ :=
  sSup (lineCountsAtLeast k n)

noncomputable def maxLinesExactly (k n : ℕ) : ℕ :=
  sSup (lineCountsExactly k n)

theorem erdos_669.variants.exactly_le_atLeast (k n : ℕ) :
    maxLinesExactly k n ≤ maxLinesAtLeast k n := by
  refine csSup_le' ?_
  rintro _ ⟨S, hS, rfl⟩
  have hfin : (linesWithAtLeastPointsFor k (S : Set ℝ²)).Finite := by
    refine ((S.finite_toSet.prod S.finite_toSet).image
      (fun pq : ℝ² × ℝ² => affineSpan ℝ {pq.1, pq.2})).subset ?_
    rintro L ⟨⟨p, hp, q, hq, -, rfl⟩, -⟩
    exact ⟨(p, q), Set.mk_mem_prod hp hq, rfl⟩
  exact le_csSup_of_le (lineCountsAtLeast_bddAbove k n) ⟨S, hS, rfl⟩
    (Set.ncard_le_ncard (linesWithPointsFor_subset_linesWithAtLeastPointsFor k _) hfin)

theorem erdos_669.variants.limit_le (k : ℕ) (hk : 2 ≤ k) (L : ℝ) (hL : Tendsto (fun n : ℕ => (maxLinesAtLeast k n : ℝ) / (n : ℝ) ^ 2) atTop (𝓝 L)) :
    L ≤ 1 / ((k : ℝ) * ((k : ℝ) - 1)) := by
  sorry

end Erdos669
