import Mathlib

open Filter SimpleGraph

namespace Erdos184

def IsCycleOrEdge {U : Type*} [Fintype U] (H : SimpleGraph U) : Prop :=
  open scoped Classical in
  (H.Connected ∧ H.IsRegularOfDegree 2) ∨ H.edgeFinset.card = 1

open scoped Classical in
theorem erdos_184.variants.conlon_fox_sudakov :
    ∀ ε > 0, ∃ f : ℕ → ℝ, (f =O[atTop] fun n : ℕ ↦ (n : ℝ)) ∧ ∀ {V : Type*} [Fintype V] [DecidableEq V] (G : SimpleGraph V), (G.minDegree : ℝ) ≥ ε * (Fintype.card V : ℝ) → ∃ (D : Finset G.Subgraph), (∀ H ∈ D, IsCycleOrEdge H.coe) ∧ IsDecomposition G D ∧ (D.card : ℝ) ≤ f (Fintype.card V) := by
  sorry

end Erdos184
