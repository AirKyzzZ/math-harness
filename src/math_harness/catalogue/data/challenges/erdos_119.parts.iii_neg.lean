import Mathlib

open Filter Finset Set

namespace Erdos119

noncomputable def p (z : ℕ → ℂ) (n : ℕ) : ℂ → ℂ :=
    fun w => ∏ i ∈ range n, (w - z i)

noncomputable def M (z : ℕ → ℂ) (n : ℕ) : ℝ :=
    sSup { (‖p z n w‖) | (w : ℂ) (_ : ‖w‖ = 1) }

theorem erdos_119.parts.iii_neg :
    ¬ (∀ (z : ℕ → ℂ) (hz : ∀ i : ℕ, ‖z i‖ = 1), ∃ (c : ℝ) (hc : c > 0), ∀ᶠ n in atTop, ∑ k ∈ range n, M z k > n ^ (1 + c)) := by
  sorry

end Erdos119
