import Mathlib

open Filter Finset Real

namespace Erdos887

theorem erdos_887.parts.ii :
    ∃ K, ∀ C > (0 : ℝ), ∀ᶠ n in atTop, #{ d ∈ Ioo ⌊√n⌋₊ ⌈√n + C * n^((1 : ℝ) / 4)⌉₊ | d ∣ n } ≤ K := by
  sorry

end Erdos887
