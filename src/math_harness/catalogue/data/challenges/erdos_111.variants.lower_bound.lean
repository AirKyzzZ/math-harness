import Mathlib

open Filter Asymptotics Cardinal SimpleGraph Set

namespace Erdos111

noncomputable def bipartiteDistance {V : Type*} (G : SimpleGraph V) : ℕ :=
  sInf {k : ℕ | ∃ H : SimpleGraph V, H ≤ G ∧ H.IsBipartite ∧
    Set.ncard (G.edgeSet \ H.edgeSet) = k}

noncomputable def hG {V : Type*} (G : SimpleGraph V) (n : ℕ) : ℕ :=
  sSup {k : ℕ | ∃ S : Set V, S.ncard = n ∧ bipartiteDistance (G.induce S) = k}

theorem erdos_111.variants.lower_bound :
    ∀ (V : Type) (G : SimpleGraph V), G.chromaticCardinal = ℵ_ 1 → ∃ c : ℝ, 0 < c ∧ ∀ᶠ n : ℕ in Filter.atTop, c * n ≤ hG G n := by
  sorry

end Erdos111
