import Mathlib

open Set

namespace Erdos225

noncomputable def trigPoly (n : ℕ) (c : ℕ → ℂ) (z : ℂ) : ℂ :=
  ∑ k ∈ Finset.range (n + 1), c k * Complex.exp (Complex.I * (k * z))

theorem erdos_225 :
    ∀ (n : ℕ) (c : ℕ → ℂ), 0 < n → c 0 ≠ 0 → c n ≠ 0 → (∀ z : ℂ, trigPoly n c z = 0 → z.im = 0) → (∀ θ ∈ Icc (0 : ℝ) (2 * Real.pi), ‖trigPoly n c θ‖ ≤ 1) → (∃ θ ∈ Icc (0 : ℝ) (2 * Real.pi), ‖trigPoly n c θ‖ = 1) → ∫ θ in (0 : ℝ)..(2 * Real.pi), ‖trigPoly n c θ‖ ≤ 4 := by
  sorry

end Erdos225
