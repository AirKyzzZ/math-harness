import Mathlib

namespace Erdos311

open Finset Filter Topology

noncomputable def delta (N : ℕ) : ℝ :=
  sInf {x : ℝ | x ≠ 0 ∧ ∃ A ⊆ Icc 1 N, x = |1 - ∑ n ∈ A, (1 : ℝ) / n|}

theorem erdos_311_neg :
    ¬ (∃ c ∈ Set.Ioo (0 : ℝ) 1, Tendsto (fun N : ℕ => -Real.log (delta N) / N) atTop (𝓝 c)) := by
  sorry

theorem delta_one : delta 1 = 1 := by
  have hset : {x : ℝ | x ≠ 0 ∧ ∃ A ⊆ Icc (1 : ℕ) 1, x = |1 - ∑ n ∈ A, (1 : ℝ) / n|} = {1} := by
    ext x
    simp only [Set.mem_ofPred_eq, Set.mem_singleton_iff]
    constructor
    · rintro ⟨hx, A, hA, rfl⟩
      rw [Icc_self, subset_singleton_iff] at hA
      rcases hA with rfl | rfl
      · simp
      · simp at hx
    · rintro rfl
      exact ⟨one_ne_zero, ∅, empty_subset _, by simp⟩
  unfold delta
  rw [hset, csInf_singleton]

end Erdos311
