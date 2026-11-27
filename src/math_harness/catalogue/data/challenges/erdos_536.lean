import Mathlib

namespace Erdos536

open Finset Nat Filter

theorem erdos_536 :
    ∀ᵉ (ε > (0: ℝ)), ∀ᶠ N in atTop, ∀ (A : Finset ℕ), A ⊆ Icc 1 N → (ε * (N : ℝ)) ≤ (A.card : ℝ) → ∃ᵉ (a ∈ A) (b ∈ A) (c ∈ A), # {a, b, c} = 3 ∧ a.lcm b = b.lcm c ∧ b.lcm c = a.lcm c := by
  sorry

-- TODO(firsching): add the statements from the additional material

end Erdos536
