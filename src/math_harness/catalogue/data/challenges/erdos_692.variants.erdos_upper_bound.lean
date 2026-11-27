import Mathlib

namespace Erdos692

open Filter

def exactlyOneDivisorIn (n m : ℕ) : Set ℕ :=
  {x | {d ∈ Set.Ioo n m | d ∣ x}.ncard = 1}

def IsDelta₁ (n m : ℕ) (δ : ℝ) : Prop :=
  (exactlyOneDivisorIn n m).HasDensity δ

def localMaxima (f : ℕ → ℝ) (a : ℕ) : Set ℕ :=
  {m | a < m ∧ f (m - 1) < f m ∧ ∃ b, m ≤ b ∧ (∀ j ∈ Set.Icc m b, f j = f m) ∧ f (b + 1) < f m}

theorem erdos_692.variants.erdos_upper_bound :
    ∀ δ : ℕ → ℕ → ℝ, (∀ a b, IsDelta₁ a b (δ a b)) → ∃ c > (0 : ℝ), ∃ C > (0 : ℝ), ∀ᶠ n in atTop, ∀ m, δ n m ≤ C / Real.log n ^ c := by
  sorry

end Erdos692
