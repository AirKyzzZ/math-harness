import Mathlib

namespace Erdos859

def DivisorSumSet (t : ℕ) := { n : ℕ | ∃ s ⊆ Nat.divisors n, t = ∑ i ∈ s, i }

open Asymptotics Filter

theorem erdos_859 :
    ∃ c₁ > 0, ∃ c₂ > (0 : ℝ), ∃ d : ℕ → ℝ, (∀ t > 0, (DivisorSumSet t).HasDensity (d t)) ∧ (fun (t : ℕ) ↦ d t) ~[atTop] (fun t ↦ c₁ / Real.log t ^ c₂) := by
  sorry

lemma erdos_859.variants.trivial_case : DivisorSumSet 0 = Set.univ := by
  simp [DivisorSumSet, Exists.intro ∅]

end Erdos859
