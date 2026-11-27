import Mathlib

open Erdos1129

namespace Erdos1130

noncomputable def upsilon {n : ℕ} (x : Fin n → ℝ) : ℝ :=
  ⨅ i : Fin (n + 1), gapMax x (i : ℕ)

noncomputable def minInteriorGapMax {n : ℕ} (x : Fin n → ℝ) : ℝ :=
  ⨅ i : Fin (n - 1), gapMax x ((i : ℕ) + 1)

theorem erdos_1130.variants.erdos_inequality (n : ℕ) (x y : Fin n → ℝ) (hx : IsNodeSet x) (hy : IsMinimiser y) :
    upsilon x ≤ lebesgueConstant y := by
  sorry

end Erdos1130
