import Mathlib

open Filter Finset Real

namespace Erdos887

theorem erdos_887.variants.rosenfeld_infinite :
    ∃ C > (0 : ℝ), Infinite {n : ℕ | 4 ≤ #{ d ∈ Ioo ⌊√n⌋₊ ⌈√n + C * n^((1 : ℝ) / 4)⌉₊ | d ∣ n }} := by
  sorry

end Erdos887
