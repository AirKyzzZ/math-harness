import Mathlib

open Filter MeasureTheory

namespace Erdos1132

noncomputable def lagrangeBasis (n : ℕ) (x : ℕ → ℝ) (k : ℕ) (t : ℝ) : ℝ :=
  (∏ i ∈ (Finset.range n).erase k, (t - x i)) / ∏ i ∈ (Finset.range n).erase k, (x k - x i)

noncomputable def lebesgueFunction (n : ℕ) (x : ℕ → ℝ) (t : ℝ) : ℝ :=
  ∑ k ∈ Finset.range n, |lagrangeBasis n x k t|

theorem lagrangeBasis_self {n : ℕ} {x : ℕ → ℝ} (hx : Set.InjOn x (Set.Iio n)) {k : ℕ}
    (hk : k < n) : lagrangeBasis n x k (x k) = 1 := by
  unfold lagrangeBasis
  apply div_self
  rw [Finset.prod_ne_zero_iff]
  intro i hi
  rw [Finset.mem_erase, Finset.mem_range] at hi
  exact sub_ne_zero.mpr fun h => hi.1 (hx (Set.mem_Iio.mpr hk) (Set.mem_Iio.mpr hi.2) h).symm

theorem erdos_1132.parts.ii_neg :
    ¬ (∀ x : ℕ → ℝ, (∀ k, x k ∈ Set.Icc (-1 : ℝ) 1) → Function.Injective x → ∀ᵐ t ∂(volume.restrict (Set.Ioo (-1 : ℝ) 1)), ∀ ε > (0 : ℝ), ∃ᶠ n : ℕ in atTop, (2 / Real.pi - ε) * Real.log n ≤ lebesgueFunction n x t) := by
  sorry

end Erdos1132
