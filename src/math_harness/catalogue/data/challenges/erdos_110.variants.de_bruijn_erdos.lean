import Mathlib

open Filter

namespace Erdos110

theorem erdos_110.variants.de_bruijn_erdos {V : Type*} (G : SimpleGraph V) (hG : G.chromaticNumber = ⊤) (n : ℕ) (hn : 1 ≤ n) :
    ∃ H : G.Subgraph, H.verts.Finite ∧ H.coe.chromaticNumber = (n : ℕ∞) := by
  sorry

end Erdos110
