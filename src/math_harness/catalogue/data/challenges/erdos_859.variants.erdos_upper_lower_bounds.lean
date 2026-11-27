import Mathlib

namespace Erdos859

def DivisorSumSet (t : ℕ) := { n : ℕ | ∃ s ⊆ Nat.divisors n, t = ∑ i ∈ s, i }

open Asymptotics Filter

theorem erdos_859.variants.erdos_upper_lower_bounds :
    ∃ᵉ (c₃ > (0 : ℝ)) (c₄ > (0 : ℝ)) (t₀ : ℕ), ∀ᶠ t in atTop, ∃ dₜ : ℝ, (DivisorSumSet t).HasDensity dₜ ∧ 1 / Real.log t ^ c₃ < dₜ ∧ dₜ < 1 / Real.log t ^ c₄ := by
  sorry

lemma erdos_859.variants.trivial_case : DivisorSumSet 0 = Set.univ := by
  simp [DivisorSumSet, Exists.intro ∅]

end Erdos859
