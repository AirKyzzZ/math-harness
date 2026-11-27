import Mathlib

open Erdos1129

namespace Erdos1130

noncomputable def upsilon {n : ℕ} (x : Fin n → ℝ) : ℝ :=
  ⨅ i : Fin (n + 1), gapMax x (i : ℕ)

noncomputable def minInteriorGapMax {n : ℕ} (x : Fin n → ℝ) : ℝ :=
  ⨅ i : Fin (n - 1), gapMax x ((i : ℕ) + 1)

theorem erdos_1130.variants.log_bound :
    ∃ C : ℝ, ∀ (n : ℕ) (x : Fin n → ℝ), 1 ≤ n → IsNodeSet x → upsilon x ≤ 2 / Real.pi * Real.log n + C := by
  sorry

end Erdos1130
