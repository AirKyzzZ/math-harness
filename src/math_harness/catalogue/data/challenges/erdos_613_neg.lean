import Mathlib

namespace Erdos613

theorem erdos_613_neg :
    ¬ (¬ ∀ n ≥ 3, ∀ (V : Type*) [Fintype V] (G : SimpleGraph V), [DecidableRel G.Adj] → G.edgeFinset.card = Nat.choose (2 * n + 1) 2 - Nat.choose n 2 - 1 → ∃ (B D : SimpleGraph V), [DecidableRel B.Adj] → [DecidableRel D.Adj] → G = B ⊔ D ∧ B.IsBipartite ∧ ∀ v, D.degree v < n) := by
  sorry

end Erdos613
