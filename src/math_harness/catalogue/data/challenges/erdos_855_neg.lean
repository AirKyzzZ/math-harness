import Mathlib

open Filter

open scoped Nat.Prime

namespace Erdos855

theorem erdos_855_neg :
    ¬ (∀ᶠ (xy : ℕ × ℕ) in atTop ×ˢ atTop, π (xy.1 + xy.2) ≤ π xy.1 + π xy.2) := by
  sorry

end Erdos855
