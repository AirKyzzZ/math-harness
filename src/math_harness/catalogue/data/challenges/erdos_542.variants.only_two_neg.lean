import Mathlib

open Filter Real

namespace Erdos542

def IsLcmFree (n : ℕ) (A : Finset ℕ) : Prop :=
  A ⊆ Finset.Icc 1 n ∧ (A : Set ℕ).Pairwise fun a b ↦ n < Nat.lcm a b

def uncovered (n : ℕ) (A : Finset ℕ) : Finset ℕ :=
  (Finset.Icc 1 n).filter fun m ↦ ∀ a ∈ A, ¬ a ∣ m

theorem erdos_542.variants.only_two_neg :
    ¬ (∀ (n : ℕ) (A : Finset ℕ), IsLcmFree n A → 1 < ∑ a ∈ A, (1 : ℝ) / a → A = {2, 3, 5} ∨ A = {3, 4, 5, 7, 11}) := by
  sorry

end Erdos542
