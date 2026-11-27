import Mathlib

namespace Erdos914

theorem erdos_914 {r m : ℕ} (hr : 2 ≤ r) (hm : 1 ≤ m) {V : Type*} [Fintype V] (G : SimpleGraph V) [DecidableRel G.Adj] (hV : Fintype.card V = r * m) (hdeg : m * (r - 1) ≤ G.minDegree) :
    ∃ K : Fin m → Finset V, (∀ i, G.IsNClique r (K i)) ∧ Pairwise fun i j => Disjoint (K i) (K j) := by
  sorry

end Erdos914
