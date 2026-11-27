import Mathlib

open Erdos1129

namespace Erdos1130

noncomputable def upsilon {n : ℕ} (x : Fin n → ℝ) : ℝ :=
  ⨅ i : Fin (n + 1), gapMax x (i : ℕ)

noncomputable def minInteriorGapMax {n : ℕ} (x : Fin n → ℝ) : ℝ :=
  ⨅ i : Fin (n - 1), gapMax x ((i : ℕ) + 1)

theorem erdos_1130.parts.i :
    ∃ C : ℝ, 0 < C ∧ ∀ (n : ℕ) (x : Fin n → ℝ), 2 ≤ n → IsNodeSet x → upsilon x ≤ C * Real.log n := by
  sorry

end Erdos1130
