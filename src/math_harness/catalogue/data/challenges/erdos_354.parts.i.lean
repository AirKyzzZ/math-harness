import Mathlib

namespace Erdos354

noncomputable def FloorMultiples (a γ : ℝ) (n : ℕ) : ℤ := ⌊γ ^ n * a⌋

noncomputable def FloorMultiples.interleave (a b γ : ℝ) (n : ℕ) : ℤ :=
  if n % 2 = 0 then
    FloorMultiples a γ (n / 2)
  else
    FloorMultiples b γ (n / 2)

theorem erdos_354.parts.i :
    ∀ᵉ (α > 0) (β > 0), Irrational (α / β) → IsAddCompleteNatSeq' (FloorMultiples.interleave α β 2) := by
  sorry

end Erdos354
