import Mathlib

open scoped ExponentialSum

namespace Erdos512

theorem erdos_512 :
    ∃ c > (0 : ℝ), ∀ (N : ℕ) (A : Finset ℤ), A.card = N → c * Real.log N ≤ ∫ θ in (0 : ℝ)..1, ‖∑ n ∈ A, e (n * θ)‖ := by
  sorry

end Erdos512
