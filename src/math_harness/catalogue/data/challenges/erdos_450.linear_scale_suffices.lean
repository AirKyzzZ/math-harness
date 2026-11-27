import Mathlib

namespace Erdos450

def HasMediumDivisor (n m : ℕ) : Prop := ∃ d : ℕ, n < d ∧ d < 2 * n ∧ d ∣ m

open scoped Classical in
noncomputable def localCount (n x y : ℕ) : ℕ :=
  ((Finset.Ioo x (x + y)).filter (HasMediumDivisor n)).card

def UniformlySparse (ε : ℝ) (n y : ℕ) : Prop := ∀ x : ℕ, (localCount n x y : ℝ) ≤ ε * (y : ℝ)

def IsSufficientScale (Y : ℝ → ℕ → ℕ) : Prop :=
  ∀ ε : ℝ, 0 < ε → ∃ N : ℕ, ∀ n : ℕ, N ≤ n → ∀ y : ℕ, Y ε n ≤ y → UniformlySparse ε n y

noncomputable def windowThreshold (ε : ℝ) (n : ℕ) : ℕ∞ :=
  ⨅ y : {y : ℕ // ∀ z ≥ y, UniformlySparse ε n z}, (y.1 : ℕ∞)

theorem erdos_450.linear_scale_suffices :
    ∃ Y : ℝ → ℕ → ℕ, (∀ ε : ℝ, 0 < ε → ∃ C : ℝ, ∀ n : ℕ, (Y ε n : ℝ) ≤ C * n) ∧ IsSufficientScale Y := by
  sorry

end Erdos450
