import Mathlib

open EuclideanGeometry Finset Real

namespace Erdos659

theorem erdos_659 :
    ∃ A : ℕ → Finset ℝ², (∀ n, #(A n) = n ∧ ∀ S ⊆ A n, #S = 4 → 3 ≤ distinctDistances S) ∧ (fun n ↦ distinctDistances (A n)) ≪ fun n ↦ n / sqrt (log n) := by
  sorry

end Erdos659
