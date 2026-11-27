import Mathlib

open Set Pointwise

namespace Erdos38

open scoped Classical in
theorem erdos_38 :
    ∃ B : Set ℕ, ¬ B.IsWeakAddBasis ∧ ∃ f : ℝ → ℝ, (∀ α, 0 < α → α < 1 → f α > 0) ∧ ∀ (A : Set ℕ) (N : ℕ), let α := schnirelmannDensity A ∃ b ∈ B, (Ioc 0 N ∩ (A ∪ (A + {b}))).ncard ≥ (α + f α) * N := by
  sorry

end Erdos38
