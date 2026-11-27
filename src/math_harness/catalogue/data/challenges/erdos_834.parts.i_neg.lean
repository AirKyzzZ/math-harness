import Mathlib

namespace Erdos834

open Filter Asymptotics

theorem erdos_834.parts.i_neg :
    ¬ (¬ ∃ (n : ℕ) (H : Finset (Finset (Fin n))), H.IsUniform 3 ∧ (H : Set (Finset (Fin n))).HasFiniteTransversal 3 ∧ ¬ (H : Set (Finset (Fin n))).HasFiniteTransversal 2 ∧ (∀ e ∈ H, (H.erase e : Set (Finset (Fin n))).HasFiniteTransversal 2) ∧ ∀ v : Fin n, 7 ≤ H.hypergraphDegree v) := by
  sorry

end Erdos834
