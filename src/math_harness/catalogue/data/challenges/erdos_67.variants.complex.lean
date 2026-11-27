import Mathlib

open Filter

namespace Erdos67

theorem erdos_67.variants.complex (f : ℕ → Metric.sphere (0 : ℂ) 1) (C : ℝ) (hC : 0 < C) :
    ∃ᵉ (d ≥ 1) (m ≥ 1), C < ‖∑ k ∈ Finset.Icc 1 m, (f (k * d)).1‖ := by
  sorry

end Erdos67
