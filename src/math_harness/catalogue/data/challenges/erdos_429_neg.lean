import Mathlib

open Filter

namespace Erdos429

theorem erdos_429_neg :
    ¬ (¬ ∃ f : ℕ → ℕ, Tendsto f atTop atTop ∧ ∀ A : Set ℕ, A.Infinite → (∀ N, (A ∩ Set.Icc 1 N).ncard ≤ f N) → (∀ p : ℕ, p.Prime → ∃ b : ZMod p, ∀ a ∈ A, (a : ZMod p) ≠ b) → ∃ n : ℤ, ∀ a ∈ A, (n + a).toNat.Prime) := by
  sorry

end Erdos429
