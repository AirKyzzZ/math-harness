import Mathlib

open SimpleGraph

namespace Erdos1079

theorem erdos_1079.variants.bondy (r n : ℕ) (hr : 4 ≤ r) (G : SimpleGraph (Fin n)) [DecidableRel G.Adj] (hG : extremalNumber n (completeGraph (Fin r)) < G.edgeSet.ncard) :
    ∃ v : Fin n, G.degree v = G.maxDegree ∧ n ≤ 2 * G.degree v ∧ extremalNumber (G.degree v) (completeGraph (Fin (r - 1))) < {e ∈ G.edgeSet | ∀ x ∈ e, G.Adj v x}.ncard := by
  sorry

end Erdos1079
