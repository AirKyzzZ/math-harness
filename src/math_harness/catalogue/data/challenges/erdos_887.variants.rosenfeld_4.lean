import Mathlib

open Filter Finset Real

namespace Erdos887

theorem erdos_887.variants.rosenfeld_4 :
    ¬ IsGreatest {K | ∃ C > (0 : ℝ), Infinite {n : ℕ | K ≤ #{ d ∈ Ioo ⌊√n⌋₊ ⌈√n + C * n^((1 : ℝ) / 4)⌉₊ | d ∣ n }}} 4 := by
  sorry

end Erdos887
