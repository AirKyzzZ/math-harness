import Mathlib

open Filter

open scoped Nat

namespace Erdos51

theorem erdos_51_neg :
    ¬ (∃ A : Set ℕ, ∃ n : A → ℕ, A.Infinite ∧ (∀ a : A, IsLeast (φ ⁻¹' {(a : ℕ)}) (n a)) ∧ Tendsto (fun a : A => (n a : ℝ) / (a : ℝ)) atTop atTop) := by
  sorry

end Erdos51
