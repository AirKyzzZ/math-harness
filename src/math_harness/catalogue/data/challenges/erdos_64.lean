import Mathlib

namespace Erdos64

theorem erdos_64 :
    ∀ (V : Type*) (G : SimpleGraph V) [Fintype V] [DecidableRel G.Adj], G.minDegree ≥ 3 → ∃ (k : ℕ) (v : V) (c : G.Walk v v), k ≥ 2 ∧ c.IsCycle ∧ c.length = 2^k := by
  sorry

-- TODO(firsching): add more context

end Erdos64
