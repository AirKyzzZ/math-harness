import Mathlib

open Finset Nat

namespace Erdos13

def IsForbiddenTripleFree (A : Finset ℕ) : Prop :=
  ∀ a ∈ A, ∀ b ∈ A, ∀ c ∈ A, a < min b c → ¬ (a ∣ b + c)

theorem erdos_13 :
    ∃ C : ℝ, ∀ N : ℕ, ∀ A ⊆ Icc 1 N, IsForbiddenTripleFree A → (A.card : ℝ) ≤ (N : ℝ) / 3 + C := by
  sorry

end Erdos13
