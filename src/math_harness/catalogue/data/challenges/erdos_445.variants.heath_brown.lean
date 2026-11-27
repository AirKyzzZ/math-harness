import Mathlib

open Filter

namespace Erdos445

def Erdos445Prop (c : ℝ) (p n : ℕ) : Prop :=
  ∃ a b : ℕ,
    n < a ∧ (a : ℝ) < (n : ℝ) + (p : ℝ) ^ c ∧
    n < b ∧ (b : ℝ) < (n : ℝ) + (p : ℝ) ^ c ∧
    a * b ≡ 1 [MOD p]

theorem erdos_445.variants.heath_brown :
    ∀ c : ℝ, c > 3 / 4 → ∀ᶠ p : ℕ in atTop, p.Prime → ∀ n : ℕ, Erdos445Prop c p n := by
  sorry

theorem erdos_445.test.small_example : Erdos445Prop 1 5 1 := by
  refine ⟨2, 3, by omega, ?_, by omega, ?_, by decide⟩
  all_goals simp only [Real.rpow_one]; norm_num

end Erdos445
