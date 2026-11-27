import Mathlib

open Filter

open scoped Topology

namespace Erdos297

def count (x : ℚ) (N : ℕ) : ℕ :=
  {A ∈ (Finset.Icc 1 N).powerset | ∑ n ∈ A, (1 / (n : ℕ) : ℚ) = x}.card

theorem count_one_five : count 1 5 = 1 := by decide +kernel

theorem count_one_six : count 1 6 = 2 := by decide +kernel

theorem count_half_six : count (1 / 2) 6 = 2 := by decide +kernel

noncomputable def massIntegral (l : ℝ) : ℝ :=
  ∫ y in (0 : ℝ)..1, 1 / (y * (1 + Real.exp (l / y)))

noncomputable def lambdaOf (x : ℝ) : ℝ :=
  sInf {l : ℝ | massIntegral l = x}

noncomputable def erdos_297.answer : ℝ :=
  (lambdaOf 1 + ∫ y in (0 : ℝ)..1, Real.log (1 + Real.exp (-lambdaOf 1 / y))) / Real.log 2

noncomputable def exponentOf (x : ℝ) : ℝ :=
  ∫ y in (0 : ℝ)..1, Real.binEntropy (1 / (1 + Real.exp (lambdaOf x / y))) / Real.log 2

theorem erdos_297.variants.general (x : ℚ) (hx : 0 < x) :
    (∃! l : ℝ, massIntegral l = x) ∧ Tendsto (fun N : ℕ => Real.logb 2 (count x N) / N) atTop (𝓝 (exponentOf x)) := by
  sorry

end Erdos297
