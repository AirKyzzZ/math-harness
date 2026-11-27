import Mathlib

open Filter Finset Asymptotics

open scoped ExponentialSum

namespace Erdos987

noncomputable def A (x : ℕ → ℝ) (k : ℕ) : EReal :=
  atTop.limsup fun n : ℕ => (‖∑ j ∈ range n, e (k * x j)‖ : EReal)

theorem erdos_987.variants.linear_upper_bound_weak :
    ∃ (x : ℕ → ℝ) (_ : ∀ j : ℕ, x j ∈ Set.Ioo (0 : ℝ) 1), ∀ k : ℕ, 1 ≤ k → A x k ≤ ((2 * k : ℝ) : EReal) := by
  sorry

end Erdos987
