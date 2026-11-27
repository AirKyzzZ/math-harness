import Mathlib

namespace Erdos362

theorem erdos_362_neg :
    ¬ (∃ C : ℝ, ∀ (A : Finset ℕ) (t : ℕ), A.Nonempty → ({S ∈ A.powerset | ∑ n ∈ S, n = t}.card : ℝ) ≤ C * 2 ^ A.card / (A.card : ℝ) ^ (3 / 2 : ℝ)) := by
  sorry

end Erdos362
