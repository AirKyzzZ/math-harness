import Mathlib

open Nat

namespace Erdos397

theorem erdos_397_neg :
    ¬ (¬ {(M, N) : Finset ℕ × Finset ℕ | Disjoint M N ∧ ∏ i ∈ M, centralBinom i = ∏ j ∈ N, centralBinom j}.Finite) := by
  sorry

end Erdos397
