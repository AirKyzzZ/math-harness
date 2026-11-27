import Mathlib

open Cardinal Ordinal

namespace Erdos590

universe u

theorem erdos_590.variants.ge_three_false {n : ℕ} (h : 3 ≤ n) :
    ¬ OrdinalCardinalRamsey (ω ^ n) (ω ^ n) 3 := by
  sorry

end Erdos590
