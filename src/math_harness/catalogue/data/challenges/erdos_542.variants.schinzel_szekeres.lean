import Mathlib

open Filter Real

namespace Erdos542

def IsLcmFree (n : ℕ) (A : Finset ℕ) : Prop :=
  A ⊆ Finset.Icc 1 n ∧ (A : Set ℕ).Pairwise fun a b ↦ n < Nat.lcm a b

def uncovered (n : ℕ) (A : Finset ℕ) : Finset ℕ :=
  (Finset.Icc 1 n).filter fun m ↦ ∀ a ∈ A, ¬ a ∣ m

theorem erdos_542.variants.schinzel_szekeres :
    ∀ ε > 0, ∀ δ > 0, ∃ (n : ℕ) (A : Finset ℕ), IsLcmFree n A ∧ 1 ∉ A ∧ ((uncovered n A).card : ℝ) ≤ δ * n ∧ 1 - ε < ∑ a ∈ A, (1 : ℝ) / a := by
  sorry

end Erdos542
