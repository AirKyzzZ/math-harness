import Mathlib

open Filter Real

namespace Erdos308

def IsRepresentable (N k : ℕ) : Prop :=
  ∃ A ⊆ Finset.Icc 1 N, ∑ n ∈ A, (1 : ℚ) / n = k

def representable (N : ℕ) : Set ℕ := {k | 0 < k ∧ IsRepresentable N k}

noncomputable def f (N : ℕ) : ℕ := sInf {k | 0 < k ∧ ¬ IsRepresentable N k}

def m (N : ℕ) : ℕ := ⌊harmonic N⌋₊

theorem erdos_308.variants.croot :
    ∃ o₁ o₂ : ℕ → ℝ, Tendsto o₁ atTop (nhds 0) ∧ Tendsto o₂ atTop (nhds 0) ∧ ∀ᶠ N : ℕ in atTop, ⌊(harmonic N : ℝ) - 9 / 2 * (1 + o₁ N) * (log (log N)) ^ 2 / log N⌋₊ + 1 ≤ f N ∧ f N ≤ ⌊(harmonic N : ℝ) - 1 / 2 * (1 + o₂ N) * (log (log N)) ^ 2 / log N⌋₊ + 1 := by
  sorry

end Erdos308
