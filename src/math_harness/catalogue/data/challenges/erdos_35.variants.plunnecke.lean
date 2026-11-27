import Mathlib

open Set Pointwise

namespace Erdos35

open scoped Classical in
theorem erdos_35.variants.plunnecke (B : Set ℕ) (k : ℕ) (h0 : 0 ∈ B) (hB : B.IsAddBasisOfOrder k) (A : Set ℕ) (hA : 0 < schnirelmannDensity A) :
    schnirelmannDensity A ^ (1 - (k : ℝ)⁻¹) ≤ schnirelmannDensity (A + B) := by
  sorry

end Erdos35
