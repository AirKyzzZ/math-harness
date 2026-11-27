import Mathlib

open MeasureTheory Filter Asymptotics Set

namespace Erdos995

noncomputable def partialSum (n : ℕ → ℕ) (f : ℝ → ℝ) (α : ℝ) (N : ℕ) : ℝ :=
  ∑ k ∈ Finset.range N, f (Int.fract (α * (n k : ℝ)))

theorem erdos_995.variants.erdos_lower_bound :
    ∃ (n : ℕ → ℕ), IsLacunary n ∧ ∃ (f : ℝ → ℝ), MemLp f 2 (volume.restrict (Icc (0 : ℝ) 1)) ∧ ∫ x in (0 : ℝ)..1, f x = 0 ∧ ∀ ε > (0 : ℝ), ∀ᵐ α ∂(volume.restrict (Icc (0 : ℝ) 1)), atTop.limsup (fun N => (((partialSum n f α N) / ((N : ℝ) * (Real.log (Real.log N)) ^ ((1 : ℝ) / 2 - ε)) : ℝ) : EReal)) = ⊤ := by
  sorry

end Erdos995
