import Mathlib

namespace Erdos914

theorem erdos_914.variants.equitable_colouring {r m : ℕ} (hr : 2 ≤ r) (hm : 1 ≤ m) {V : Type*} [Fintype V] (G : SimpleGraph V) [DecidableRel G.Adj] (hV : Fintype.card V = r * m) (hdeg : G.maxDegree ≤ m - 1) :
    ∃ C : G.Coloring (Fin m), ∀ i, (C.colorClass i).ncard = r := by
  sorry

end Erdos914
