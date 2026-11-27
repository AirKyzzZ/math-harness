import Mathlib

open Polynomial MeasureTheory Filter

namespace Erdos114

def lemniscate (p : ℂ[X]) : Set ℂ := {z | ‖p.eval z‖ = 1}

noncomputable def lemniscateLength (p : ℂ[X]) : ENNReal := μH[1] (lemniscate p)

theorem erdos_114 :
    ∀ n : ℕ, 1 ≤ n → ∀ p : ℂ[X], p.Monic → p.natDegree = n → lemniscateLength p ≤ lemniscateLength (X ^ n - 1) := by
  sorry

theorem erdos_114.variants.one (p : ℂ[X]) (hp : p.Monic) (hdeg : p.natDegree = 1) :
    lemniscateLength p ≤ lemniscateLength (X ^ 1 - 1) := by
  have hpe : p = X + C (p.coeff 0) := by
    have := hp.as_sum
    rw [hdeg] at this
    simpa [Finset.sum_range_one] using this
  have hset : lemniscate p =
      (IsometryEquiv.addRight (1 + p.coeff 0)) ⁻¹' lemniscate (X ^ 1 - 1) := by
    ext z
    rw [hpe]
    simp [lemniscate]
    ring_nf
  rw [lemniscateLength, lemniscateLength, hset, IsometryEquiv.hausdorffMeasure_preimage]

end Erdos114
