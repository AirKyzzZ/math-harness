import Mathlib

open MeasureTheory Filter Asymptotics Set

namespace Erdos995

noncomputable def partialSum (n : ℕ → ℕ) (f : ℝ → ℝ) (α : ℝ) (N : ℕ) : ℝ :=
  ∑ k ∈ Finset.range N, f (Int.fract (α * (n k : ℝ)))

theorem erdos_995_neg :
    ¬ (∀ (n : ℕ → ℕ), IsLacunary n → ∀ (f : ℝ → ℝ), MemLp f 2 (volume.restrict (Icc (0 : ℝ) 1)) → ∫ x in (0 : ℝ)..1, f x = 0 → ∀ᵐ α ∂(volume.restrict (Icc (0 : ℝ) 1)), partialSum n f α =o[atTop] fun N => (N : ℝ) * Real.sqrt (Real.log (Real.log N))) := by
  sorry

end Erdos995
