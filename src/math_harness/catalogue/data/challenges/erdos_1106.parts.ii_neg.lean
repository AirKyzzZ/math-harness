import Mathlib

open Nat Finset Filter Topology

namespace Erdos1106

theorem erdos_1106.parts.ii_neg :
    ¬ (∀ᶠ n in atTop, #(∏ i ∈ Icc 1 n, partitionNumber i).primeFactors > n) := by
  sorry

end Erdos1106
