import Mathlib

open Filter Real

namespace Erdos308

def IsRepresentable (N k : ℕ) : Prop :=
  ∃ A ⊆ Finset.Icc 1 N, ∑ n ∈ A, (1 : ℚ) / n = k

def representable (N : ℕ) : Set ℕ := {k | 0 < k ∧ IsRepresentable N k}

noncomputable def f (N : ℕ) : ℕ := sInf {k | 0 < k ∧ ¬ IsRepresentable N k}

def m (N : ℕ) : ℕ := ⌊harmonic N⌋₊

theorem erdos_308.variants.all_N :
    ∀ N ≥ 1, ∃ m, representable N = Set.Icc 1 m := by
  sorry

end Erdos308
