import Mathlib

namespace Erdos486

theorem erdos_486_neg :
    ¬ (¬ ∀ X : (n : ℕ) → Set (ZMod n), ∃ d, {m : ℕ | ∀ n, 0 < n → n < m → (m : ZMod n) ∉ X n}.HasLogDensity d) := by
  sorry

end Erdos486
