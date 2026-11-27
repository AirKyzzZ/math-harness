import Mathlib

namespace Erdos834

open Filter Asymptotics

theorem erdos_834.parts.ii_neg :
    ¬ (∃ (n : ℕ) (H : Finset (Finset (Fin n))), H.IsUniform 3 ∧ H.HasHypergraphChromaticNumber 3 ∧ (∀ e ∈ H, (H.erase e).HypergraphColorable 2) ∧ (∀ v : Fin n, (H.filter (fun e ↦ v ∉ e)).HypergraphColorable 2) ∧ ∀ v : Fin n, 7 ≤ H.hypergraphDegree v) := by
  sorry

end Erdos834
