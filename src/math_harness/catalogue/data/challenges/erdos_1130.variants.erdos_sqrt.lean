import Mathlib

open Erdos1129

namespace Erdos1130

noncomputable def upsilon {n : ℕ} (x : Fin n → ℝ) : ℝ :=
  ⨅ i : Fin (n + 1), gapMax x (i : ℕ)

noncomputable def minInteriorGapMax {n : ℕ} (x : Fin n → ℝ) : ℝ :=
  ⨅ i : Fin (n - 1), gapMax x ((i : ℕ) + 1)

theorem erdos_1130.variants.erdos_sqrt (n : ℕ) (hn : 2 ≤ n) (x : Fin n → ℝ) (hx : IsNodeSet x) :
    upsilon x < Real.sqrt n := by
  sorry

end Erdos1130
