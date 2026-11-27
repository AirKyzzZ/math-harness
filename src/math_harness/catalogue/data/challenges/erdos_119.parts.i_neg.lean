import Mathlib

open Filter Finset Set

namespace Erdos119

noncomputable def p (z : ℕ → ℂ) (n : ℕ) : ℂ → ℂ :=
    fun w => ∏ i ∈ range n, (w - z i)

noncomputable def M (z : ℕ → ℂ) (n : ℕ) : ℝ :=
    sSup { (‖p z n w‖) | (w : ℂ) (_ : ‖w‖ = 1) }

theorem erdos_119.parts.i_neg :
    ¬ (∀ (z : ℕ → ℂ) (hz : ∀ i : ℕ, ‖z i‖ = 1), atTop.limsup (fun n => (M z n : EReal)) = ⊤) := by
  sorry

end Erdos119
