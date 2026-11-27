import Mathlib

namespace Erdos510

open Real Filter

open scoped Finset

theorem erdos_510.variants.bedert :
    ∃ (c : ℝ) (hc : 0 < c), ∀ᶠ N in atTop, ∀ (A : Finset ℕ), 0 ∉ A → #A = N → ∃ θ, ∑ n ∈ A, cos (n * θ) < - c * N ^ (1 / 7 : ℝ) := by
  sorry

-- TODO(firsching): add the additional material

end Erdos510
