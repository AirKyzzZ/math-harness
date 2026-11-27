import Mathlib

namespace Erdos628

open SimpleGraph

theorem erdos_628.variants.k_5_a_3_b_3 (V : Type*) [Fintype V] (G : SimpleGraph V) [DecidableRel G.Adj] (hG_chrom : G.chromaticNumber = (5 : ℕ∞)) (hG_clique : G.CliqueFree 5) :
    ∃ (s : Set V), (G.induce s).chromaticNumber ≥ (3 : ℕ∞) ∧ (G.induce sᶜ).chromaticNumber ≥ (3 : ℕ∞) := by
  sorry

end Erdos628
