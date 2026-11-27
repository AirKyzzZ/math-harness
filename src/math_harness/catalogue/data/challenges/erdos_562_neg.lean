import Mathlib

open Combinatorics Filter Real

open scoped Asymptotics

namespace Erdos562

theorem erdos_562_neg :
    ¬ (∀ r ≥ 3, (fun n ↦ log^[r - 1] (hypergraphRamsey r n)) =Θ[atTop] (fun n ↦ (n : ℝ))) := by
  sorry

end Erdos562
