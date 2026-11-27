import Mathlib

namespace Erdos215

theorem erdos_215 :
    ∃ S : Set ℂ, ∀ u t : ℂ, ‖u‖ = 1 → ∃! z : ℂ, z ∈ (fun w => u * w + t) '' S ∧ ∃ a b : ℤ, z = a + b * Complex.I := by
  sorry

end Erdos215
