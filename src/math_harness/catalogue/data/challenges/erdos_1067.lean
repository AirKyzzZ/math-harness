import Mathlib

open Cardinal SimpleGraph

namespace Erdos1067

def InfinitelyEdgeConnected {V : Type*} (G : SimpleGraph V) : Prop :=
  ∀ ⦃s : Set (Sym2 V)⦄, s.Finite → (G.deleteEdges s).Connected

theorem erdos_1067 :
    ¬ ∀ (V : Type) (G : SimpleGraph V), G.chromaticCardinal = ℵ_ 1 → ∃ (H : G.Subgraph), H.coe.chromaticCardinal = ℵ_ 1 ∧ InfinitelyConnected H.coe := by
  sorry

-- TODO: Formalize variant independent of ZFC.

end Erdos1067
