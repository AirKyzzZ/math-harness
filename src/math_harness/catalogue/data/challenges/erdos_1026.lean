import Mathlib

namespace Erdos1026

open Filter

def monotonicSubsequenceSums {n : ℕ} (x : Fin n → ℝ) : Set ℝ :=
  {S | ∃ I : Finset (Fin n), (MonotoneOn x ↑I ∨ AntitoneOn x ↑I) ∧ (∑ i ∈ I, x i) = S}

def admissibleConstants : Set ℝ :=
  {c : ℝ | ∀ ε : ℝ, 0 < ε → ∀ᶠ n : ℕ in atTop, ∀ x : Fin n → ℝ, Function.Injective x →
    (∀ i, 0 < x i) →
    ∃ S ∈ monotonicSubsequenceSums x, (c - ε) / Real.sqrt (n : ℝ) * (∑ i, x i) ≤ S}

theorem erdos_1026 :
    IsGreatest admissibleConstants 1 := by
  sorry

end Erdos1026
