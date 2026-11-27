import Mathlib

open Nat Filter Set

namespace Erdos428

noncomputable def primeDensityRatio (A : Set ℕ) (n : ℕ) : ℝ :=
  (A ∩ Icc 1 n).ncard / (primeCounting n)

theorem erdos_428_neg :
    ¬ (∃ A : Set ℕ, (∃ᶠ n in atTop, ∀ a ∈ A, 0 < a → a < n → (n - a).Prime) ∧ liminf (fun n ↦ primeDensityRatio A n) atTop > 0) := by
  sorry

end Erdos428
