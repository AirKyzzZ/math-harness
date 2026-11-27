import Mathlib

open Filter MeasureTheory Set

namespace Erdos994

open scoped Classical in
noncomputable def visitAverage (E : Set ℝ) (α : ℝ) (n : ℕ) : ℝ :=
  (∑ k ∈ Finset.Icc 1 n, if Int.fract (k * α) ∈ E then (1 : ℝ) else 0) / n

theorem erdos_994_neg :
    ¬ (¬ ∀ E ⊆ Ioo (0 : ℝ) 1, MeasurableSet E → ∀ᵐ α : ℝ, Tendsto (visitAverage E α) atTop (nhds (volume E).toReal)) := by
  sorry

theorem erdos_994.variants.simultaneous :
    ¬ ∀ᵐ α : ℝ, ∀ E ⊆ Ioo (0 : ℝ) 1, MeasurableSet E →
      Tendsto (visitAverage E α) atTop (nhds (volume E).toReal) := by
  intro h
  obtain ⟨α, hα⟩ := h.exists
  set O : Set ℝ := Set.range fun k : ℕ ↦ Int.fract (((k + 1 : ℕ) : ℝ) * α) with hO_def
  have hO : volume O = 0 := (Set.countable_range _).measure_zero _
  have hE := hα (Ioo 0 1 \ O) Set.sdiff_subset
    (measurableSet_Ioo.diff (Set.countable_range _).measurableSet)
  have hvol : volume (Ioo (0 : ℝ) 1 \ O) = 1 := by
    rw [measure_sdiff_null hO, Real.volume_Ioo]
    simp
  have hzero : visitAverage (Ioo 0 1 \ O) α = fun _ ↦ 0 := by
    funext n
    unfold visitAverage
    rw [Finset.sum_eq_zero, zero_div]
    intro k hk
    rw [Finset.mem_Icc] at hk
    rw [if_neg]
    rintro ⟨-, hmem⟩
    exact hmem ⟨k - 1, by simp only [Nat.sub_add_cancel hk.1]⟩
  rw [hzero, hvol, ENNReal.toReal_one] at hE
  exact one_ne_zero (tendsto_nhds_unique hE tendsto_const_nhds)

end Erdos994
