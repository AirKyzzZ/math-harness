import Mathlib

open Filter Asymptotics Cardinal SimpleGraph Set

namespace Erdos111

noncomputable def bipartiteDistance {V : Type*} (G : SimpleGraph V) : ℕ :=
  sInf {k : ℕ | ∃ H : SimpleGraph V, H ≤ G ∧ H.IsBipartite ∧
    Set.ncard (G.edgeSet \ H.edgeSet) = k}

noncomputable def hG {V : Type*} (G : SimpleGraph V) (n : ℕ) : ℕ :=
  sSup {k : ℕ | ∃ S : Set V, S.ncard = n ∧ bipartiteDistance (G.induce S) = k}

theorem erdos_111.variants.erdos_conjecture :
    ∀ ε : ℝ, 0 < ε → ∃ (V : Type) (G : SimpleGraph V), G.chromaticCardinal = ℵ_ 1 ∧ (fun n : ℕ => (hG G n : ℝ)) =O[atTop] (fun n : ℕ => (n : ℝ) ^ (1 + ε)) := by
  sorry

end Erdos111
