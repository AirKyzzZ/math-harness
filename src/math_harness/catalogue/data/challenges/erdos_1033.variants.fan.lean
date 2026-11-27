import Mathlib

open Filter Finset

namespace Erdos1033

theorem erdos_1033.variants.fan (n : ℕ) (G : SimpleGraph (Fin n)) [DecidableRel G.Adj] (hG : n ^ 2 < 4 * #G.edgeFinset) :
    ∃ t, G.IsNClique 3 t ∧ 21 * n ≤ 16 * ∑ v ∈ t, G.degree v := by
  sorry

end Erdos1033
