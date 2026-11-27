import Mathlib

open Filter Asymptotics AdditiveCombinatorics

open scoped Pointwise

namespace Erdos29

theorem erdos_29 :
    ∃ A : Set ℕ, A + A = Set.univ ∧ ∀ ε : ℝ, 0 < ε → (fun n : ℕ => (sumRep A n : ℝ)) =o[atTop] fun n : ℕ => (n : ℝ) ^ ε := by
  sorry

end Erdos29
