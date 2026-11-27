import Mathlib

open Filter

namespace Erdos247

theorem erdos_247_neg :
    ¬ (∀ (n : ℕ → ℕ), (StrictMono n) → atTop.limsup (fun k => (n k / k.succ : EReal)) = ⊤ → Transcendental ℚ (∑' k, (1 : ℝ) / 2 ^ n k)) := by
  sorry

end Erdos247
