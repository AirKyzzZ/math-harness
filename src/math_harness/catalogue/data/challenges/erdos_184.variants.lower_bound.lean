import Mathlib

open Filter SimpleGraph

namespace Erdos184

def IsCycleOrEdge {U : Type*} [Fintype U] (H : SimpleGraph U) : Prop :=
  open scoped Classical in
  (H.Connected ∧ H.IsRegularOfDegree 2) ∨ H.edgeFinset.card = 1

open scoped Classical in
theorem erdos_184.variants.lower_bound :
    ∃ c > 0, ∀ᶠ n in atTop, let G : SimpleGraph (Fin n) := fromRel (fun (i j : Fin n) => (i : ℕ) < 3 ∧ 3 ≤ (j : ℕ)); ∀ (D : Finset G.Subgraph), (∀ H ∈ D, IsCycleOrEdge H.coe) → IsDecomposition G D → (1 + c) * (n : ℝ) ≤ (D.card : ℝ) := by
  sorry

end Erdos184
