import Mathlib

open Filter Real

namespace Erdos542

def IsLcmFree (n : ℕ) (A : Finset ℕ) : Prop :=
  A ⊆ Finset.Icc 1 n ∧ (A : Set ℕ).Pairwise fun a b ↦ n < Nat.lcm a b

def uncovered (n : ℕ) (A : Finset ℕ) : Finset ℕ :=
  (Finset.Icc 1 n).filter fun m ↦ ∀ a ∈ A, ¬ a ∣ m

theorem erdos_542.parts.ii :
    ¬ ∃ c > 0, ∀ (n : ℕ) (A : Finset ℕ), IsLcmFree n A → 1 ∉ A → c * n ≤ ((uncovered n A).card : ℝ) := by
  sorry

end Erdos542
