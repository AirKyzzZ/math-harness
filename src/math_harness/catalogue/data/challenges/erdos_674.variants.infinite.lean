import Mathlib

namespace Erdos674

def solutionSet : Set (ℕ × ℕ × ℕ) :=
  {(x, y, z) | 1 < x ∧ 1 < y ∧ 1 < z ∧ x ^ x * y ^ y = z ^ z}

theorem erdos_674.variants.infinite :
    solutionSet.Infinite := by
  sorry

end Erdos674
