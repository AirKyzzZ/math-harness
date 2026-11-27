import Mathlib

open Erdos1129

namespace Erdos1130

noncomputable def upsilon {n : ℕ} (x : Fin n → ℝ) : ℝ :=
  ⨅ i : Fin (n + 1), gapMax x (i : ℕ)

noncomputable def minInteriorGapMax {n : ℕ} (x : Fin n → ℝ) : ℝ :=
  ⨅ i : Fin (n - 1), gapMax x ((i : ℕ) + 1)

theorem erdos_1130.variants.canonical (n : ℕ) :
    {x : Fin n → ℝ | IsCanonical x ∧ ∀ y : Fin n → ℝ, IsCanonical y → minInteriorGapMax y ≤ minInteriorGapMax x} = {x | IsCanonical x ∧ Equioscillates x} := by
  sorry

end Erdos1130
