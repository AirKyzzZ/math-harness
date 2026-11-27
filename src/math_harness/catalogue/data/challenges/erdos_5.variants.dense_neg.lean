import Mathlib

open Filter MeasureTheory Real Set

open scoped Topology

namespace Erdos5

noncomputable def normalizedGap (n : ℕ) : ℝ := primeGap n / log n

def limitPointSet : Set ℝ := {x : ℝ | MapClusterPt x atTop normalizedGap}

theorem erdos_5.variants.dense_neg :
    ¬ (Ici (0 : ℝ) ⊆ closure limitPointSet) := by
  sorry

theorem mem_limitPointSet_iff (x : ℝ) : x ∈ limitPointSet ↔
    ∃ n : ℕ → ℕ, StrictMono n ∧ Tendsto (fun i => normalizedGap (n i)) atTop (𝓝 x) :=
  ⟨fun hx => hx.tendsto_subseq, fun ⟨_n, hn, h⟩ => h.mapClusterPt.of_comp hn.tendsto_atTop⟩

theorem normalizedGap_nonneg (n : ℕ) : 0 ≤ normalizedGap n :=
  div_nonneg (Nat.cast_nonneg _) (log_natCast_nonneg _)

theorem limitPointSet_subset_Ici : limitPointSet ⊆ Ici 0 := by
  intro x hx
  obtain ⟨n, -, h⟩ := (mem_limitPointSet_iff x).1 hx
  exact ge_of_tendsto' h fun i => normalizedGap_nonneg (n i)

theorem erdos_5_iff_limit_point_set :
    (∀ C : ℝ, 0 ≤ C → C ∈ limitPointSet) ↔ limitPointSet = Ici 0 :=
  ⟨fun h => limitPointSet_subset_Ici.antisymm h, fun h _ hC => h ▸ hC⟩

theorem isClosed_limitPointSet : IsClosed limitPointSet := isClosed_setOfPred_clusterPt

theorem dense_iff_limit_point_set :
    Ici (0 : ℝ) ⊆ closure limitPointSet ↔ limitPointSet = Ici 0 := by
  rw [isClosed_limitPointSet.closure_eq]
  exact ⟨fun h => limitPointSet_subset_Ici.antisymm h, fun h => h.ge⟩

-- See also Erdős Problem 234, which concerns the density of the integers `n` with

-- `(p (n + 1) - p n) / log n < c`.

end Erdos5
