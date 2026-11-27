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

theorem erdos_1132.variants.tao :
    ∀ x : ℕ → ℕ → ℝ, (∀ n, ∀ k < n, x n k ∈ Set.Icc (-1 : ℝ) 1) → (∀ n, Set.InjOn (x n) (Set.Iio n)) → ∀ ω : ℕ → ℝ, Tendsto ω atTop atTop → Set.Ioo (-1 : ℝ) 1 ⊆ closure {t ∈ Set.Ioo (-1 : ℝ) 1 | ∃ᶠ n : ℕ in atTop, 2 / Real.pi * Real.log n - ω n ≤ lebesgueFunction n (x n) t} := by
  sorry

end Erdos1132
