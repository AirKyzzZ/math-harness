import Mathlib

open Filter

namespace Erdos491

theorem erdos_491_neg :
    ¬ (∀ (f : ℕ → ℝ), (∀ᵉ (a > 0) (b > 0), a.Coprime b → f (a * b) = f a + f b) → (∃ C : ℝ, ∀ n : ℕ, |f (n + 1) - f n| < C) → ∃ c : ℝ, (fun n : ℕ ↦ f n - c * Real.log n) =O[atTop] (fun _ : ℕ ↦ (1 : ℝ))) := by
  sorry

end Erdos491
