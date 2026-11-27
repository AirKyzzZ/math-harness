import Mathlib

open Filter

open scoped ArithmeticFunction.sigma

namespace Erdos419

noncomputable def factorialDivisorRatio (n : ℕ) : ℝ :=
  (σ 0 (n + 1).factorial : ℝ) / (σ 0 n.factorial : ℝ)

def limitPointSet : Set ℝ :=
  {1} ∪ {x | ∃ k : ℕ, 1 ≤ k ∧ x = 1 + 1 / (k : ℝ)}

theorem erdos_419 :
    {x : ℝ | MapClusterPt x atTop factorialDivisorRatio} = limitPointSet := by
  sorry

end Erdos419
