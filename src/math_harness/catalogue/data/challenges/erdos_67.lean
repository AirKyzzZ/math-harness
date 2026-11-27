import Mathlib

open Filter

namespace Erdos67

theorem erdos_67 (f : ℕ → ({-1, 1} : Finset ℝ)) (C : ℝ) (hC : 0 < C) :
    ∃ᵉ (d ≥ 1) (m ≥ 1), C < |∑ k ∈ Finset.Icc 1 m, (f (k * d)).1| := by
  sorry

end Erdos67
