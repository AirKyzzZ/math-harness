import Mathlib

open Filter Asymptotics

namespace Erdos441

noncomputable def g (N : ℕ) : ℕ :=
  sSup {k | ∃ A : Finset ℕ,
    A ⊆ Finset.Icc 1 N ∧ (∀ a ∈ A, ∀ b ∈ A, Nat.lcm a b ≤ N) ∧ A.card = k}

def erdosConstruction (N : ℕ) : Finset ℕ :=
  (Finset.Icc 1 N).filter fun a ↦ 2 * a ^ 2 ≤ N ∨ (2 ∣ a ∧ a ^ 2 ≤ 2 * N)

theorem erdos_441.variants.erdos_upper_bound :
    ∃ C : ℝ, ∀ N : ℕ, (g N : ℝ) ≤ √(4 * N) + C := by
  sorry

end Erdos441
