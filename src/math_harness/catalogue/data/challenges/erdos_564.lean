import Mathlib

namespace Erdos564

open Combinatorics Real Filter

theorem erdos_564 :
    ∃ c > (0 : ℝ), ∀ᶠ n : ℕ in atTop, (2 : ℝ) ^ (2 : ℝ) ^ (c * n) ≤ hypergraphRamsey 3 n := by
  sorry

end Erdos564
