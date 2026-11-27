import Mathlib

open Filter

namespace Erdos935

theorem erdos_935.parts.iii :
    ∀ ℓ : ℕ, 2 ≤ ℓ → Tendsto (fun n : ℕ ↦ ((Erdos367.B 2 (∏ m ∈ Finset.Icc n (n + ℓ), m) : ℕ) : ℝ) / (n : ℝ) ^ (ℓ + 1)) atTop (nhds 0) := by
  sorry

end Erdos935
