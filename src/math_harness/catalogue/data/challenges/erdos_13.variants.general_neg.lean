import Mathlib

open Finset Nat

namespace Erdos13

def IsForbiddenTripleFree (A : Finset ℕ) : Prop :=
  ∀ a ∈ A, ∀ b ∈ A, ∀ c ∈ A, a < min b c → ¬ (a ∣ b + c)

theorem erdos_13.variants.general_neg :
    ¬ (∀ r : ℕ, ∃ C : ℝ, ∀ N : ℕ, ∀ A ⊆ Icc 1 N, (∀ a ∈ A, ∀ (b : Fin r → ℕ), (∀ i, b i ∈ A) → (∀ i, a < b i) → ¬ (a ∣ ∑ i, b i)) → (A.card : ℝ) ≤ (N : ℝ) / (r + 1) + C) := by
  sorry

end Erdos13
