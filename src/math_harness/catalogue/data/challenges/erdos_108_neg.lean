import Mathlib

universe u

namespace Erdos108

open Erdos108

theorem erdos_108_neg :
    ¬ (¬ ∀ r ≥ 4, ∀ k ≥ (2 : ℕ), ∃ (f : ℕ), ∀ (V : Type u) (G : SimpleGraph V) (_ : Nonempty V) (hchro : f ≤ SimpleGraph.chromaticNumber G), ∃ (H : G.Subgraph), (SimpleGraph.girth H.coe ≥ r) ∧ (SimpleGraph.chromaticNumber H.coe ≥ k)) := by
  sorry

-- TODO: Proof for the case r=4 and statement for the infinite case

end Erdos108
