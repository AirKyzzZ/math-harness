import Mathlib

open Filter Finset Asymptotics

open scoped ExponentialSum

namespace Erdos987

noncomputable def A (x : ℕ → ℝ) (k : ℕ) : EReal :=
  atTop.limsup fun n : ℕ => (‖∑ j ∈ range n, e (k * x j)‖ : EReal)

theorem erdos_987.variants.finite_distinct_points (x : ℕ → ℝ) (_hx : ∀ j : ℕ, x j ∈ Set.Ioo (0 : ℝ) 1) (hfin : (Set.range x).Finite) :
    ∃ᶠ k : ℕ in atTop, A x k = ⊤ := by
  sorry

end Erdos987
