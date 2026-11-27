import Mathlib

open Nat Finset Filter Topology

namespace Erdos1106

theorem erdos_1106.parts.i_neg :
    ¬ (Tendsto (fun n ↦ #(∏ i ∈ Icc 1 n, partitionNumber i).primeFactors) atTop atTop) := by
  sorry

end Erdos1106
