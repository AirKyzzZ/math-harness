import Mathlib

open Filter Asymptotics

namespace Erdos1081

def IsSumOfTwoSquarefull (n : ℕ) : Prop :=
  ∃ a b : ℕ, 0 < a ∧ 0 < b ∧ a.Powerful ∧ b.Powerful ∧ n = a + b

noncomputable def A (x : ℝ) : ℕ :=
  {n : ℕ | 0 < n ∧ (n : ℝ) ≤ x ∧ IsSumOfTwoSquarefull n}.ncard

noncomputable def alpha : ℝ := 1 - 2 ^ (-(1 : ℝ) / 3)

theorem isSumOfTwoSquarefull_two : IsSumOfTwoSquarefull 2 :=
  ⟨1, 1, one_pos, one_pos, Nat.Full.one_right 2, Nat.Full.one_right 2, rfl⟩

theorem erdos_1081.variants.blomer_granville :
    ∃ C : ℝ, 0 < C ∧ ∀ᶠ x : ℝ in atTop, x / Real.log x ^ alpha / Real.log (Real.log x) ^ C ≤ A x ∧ (A x : ℝ) ≤ x / Real.log x ^ alpha * Real.log (Real.log x) ^ C := by
  sorry

end Erdos1081
