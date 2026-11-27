import Mathlib

namespace Erdos1007

open scoped EuclideanGeometry

variable {V : Type*}

abbrev K133 := SimpleGraph.completeMultipartiteGraph fun i : Fin 3 => Fin (![1, 3, 3] i)

theorem erdos_1007.variants.dimension_four_extremal (n : ℕ) (G : SimpleGraph (Fin n)) (hdim : G.HasDimension 4) (hcard : G.edgeSet.ncard = 9) (hdeg : ∀ v : Fin n, ∃ w : Fin n, G.Adj v w) :
    Nonempty (G ≃g completeBipartiteGraph (Fin 3) (Fin 3)) := by
  sorry

end Erdos1007
