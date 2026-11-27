import Mathlib

namespace Erdos773

open Filter

theorem erdos_773 :
    ∀ ε > (0 : ℝ), ∀ᶠ N : ℕ in atTop, (N : ℝ) ^ (1 - ε) ≤ (Finset.maxSidonSubsetCard (Finset.image (fun n : ℕ => n ^ 2) (Finset.Icc 1 N)) : ℝ) := by
  sorry

end Erdos773
