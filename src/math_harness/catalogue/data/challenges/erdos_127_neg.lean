import Mathlib

open Filter Asymptotics SimpleGraph

namespace Erdos127

noncomputable def f (m : ℕ) : ℕ :=
  sSup {k : ℕ | ∀ (V : Type) [Fintype V] (G : SimpleGraph V), G.edgeSet.ncard = m →
    ∃ H : SimpleGraph V, H ≤ G ∧ H.IsBipartite ∧
      (m : ℝ) / 2 + (√(8 * m + 1) - 1) / 8 + k ≤ H.edgeSet.ncard}

theorem erdos_127_neg :
    ¬ (∃ m : ℕ → ℕ, Tendsto m atTop atTop ∧ Tendsto (fun i => f (m i)) atTop atTop) := by
  sorry

end Erdos127
