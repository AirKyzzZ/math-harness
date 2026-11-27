import Mathlib

namespace Erdos71

theorem erdos_71 :
    ∀ P : Set ℕ, P.IsAPOfLength ⊤ → (∃ n ∈ P, Even n) → ∃ c : ℚ, ∀ (V : Type) [Fintype V] [DecidableEq V] (G : SimpleGraph V) [DecidableRel G.Adj], c ≤ G.averageDegree → ∃ (v : V) (w : G.Walk v v), w.IsCycle ∧ w.length ∈ P := by
  sorry

end Erdos71
