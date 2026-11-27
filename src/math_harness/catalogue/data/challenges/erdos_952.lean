import Mathlib

namespace Erdos952

theorem erdos_952 :
    ¬ ∃ (x : ℕ → GaussianInt) (C : ℤ), Function.Injective x ∧ ∀ n, Prime (x n) ∧ (x (n + 1) - x n).norm < C := by
  sorry

end Erdos952
