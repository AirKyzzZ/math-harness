import Mathlib

namespace Erdos628

open SimpleGraph

theorem erdos_628 (V : Type*) [Fintype V] (G : SimpleGraph V) (k : ℕ) (hG_chrom : G.chromaticNumber = (k : ℕ∞)) (hG_clique : G.CliqueFree k) (a b : ℕ) (ha : a ≥ 2) (hb : b ≥ 2) (hab : a + b = k + 1) :
    ∃ (s : Set V), (G.induce s).chromaticNumber ≥ (a : ℕ∞) ∧ (G.induce sᶜ).chromaticNumber ≥ (b : ℕ∞) := by
  sorry

end Erdos628
