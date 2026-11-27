import Mathlib

namespace Erdos521

open MeasureTheory Filter Polynomial

open scoped Topology

def sign (b : Bool) : ℝ := if b then 1 else -1

noncomputable def fairCoin : Measure Bool :=
  (2 : ENNReal)⁻¹ • (Measure.dirac true + Measure.dirac false)

theorem fairCoin_apply (b : Bool) : fairCoin {b} = 2⁻¹ := by
  cases b <;> simp [fairCoin]

theorem fairCoin_isProbabilityMeasure : IsProbabilityMeasure fairCoin := by
  constructor
  simp [fairCoin]
  rw [ENNReal.inv_two_add_inv_two]

noncomputable def rademacherMeasure : Measure (ℕ → Bool) :=
  Measure.infinitePi (fun _ : ℕ ↦ fairCoin)

noncomputable def littlewoodPolynomial (ω : ℕ → Bool) (n : ℕ) : ℝ[X] :=
  ∑ k ∈ Finset.range (n + 1), Polynomial.monomial k (sign (ω k))

noncomputable def realRootCount (ω : ℕ → Bool) (n : ℕ) : ℕ :=
  Set.ncard ((littlewoodPolynomial ω n).rootSet ℝ)

def Claim : Prop :=
  ∀ᵐ ω ∂rademacherMeasure,
    Tendsto (fun n : ℕ ↦ (realRootCount ω n : ℝ) / Real.log (n : ℝ))
      atTop (𝓝 ((2 : ℝ) / Real.pi))

theorem erdos_521_neg :
    ¬ (¬ Claim) := by
  sorry

end Erdos521
