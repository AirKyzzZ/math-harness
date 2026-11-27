import Mathlib

open Filter Finset Asymptotics

open scoped ExponentialSum

namespace Erdos987

noncomputable def A (x : ℕ → ℝ) (k : ℕ) : EReal :=
  atTop.limsup fun n : ℕ => (‖∑ j ∈ range n, e (k * x j)‖ : EReal)

theorem erdos_987.parts.ii_neg :
    ¬ (∃ (x : ℕ → ℝ) (_ : ∀ j : ℕ, x j ∈ Set.Ioo (0 : ℝ) 1) (b : ℕ → ℝ), b =o[atTop] (fun k : ℕ => (k : ℝ)) ∧ ∀ᶠ k : ℕ in atTop, A x k ≤ ((b k : ℝ) : EReal)) := by
  sorry

end Erdos987
