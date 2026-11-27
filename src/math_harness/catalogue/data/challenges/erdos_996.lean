import Mathlib

open MeasureTheory AddCircle Filter Topology Asymptotics Finset Real

namespace Erdos996

noncomputable def fourierPartial {T : ℝ} [hT : Fact (0 < T)] (f : Lp ℂ 2 (@haarAddCircle T hT))
    (k : ℕ) : AddCircle T → ℂ :=
  fun x => ∑ i ∈ Icc (-k : ℤ) k, fourierCoeff f i • fourier i x

theorem erdos_996 :
    ∃ (C : ℝ), 0 < C ∧ ∀ (f : Lp ℂ 2 (haarAddCircle (T := 1))) (n : ℕ → ℕ), IsLacunary n → (fun k => (eLpNorm (⇑f - fourierPartial f k) 2 (haarAddCircle (T := 1))).toReal) =O[atTop] (fun k => 1 / (log (log (log k))) ^ C) → ∀ᵐ x, Tendsto (fun N => (∑ k ∈ .range N, f (n k • x)) / N) atTop (𝓝 (∫ t, f t ∂haarAddCircle)) := by
  sorry

end Erdos996
