import Mathlib

namespace Erdos1007

open scoped EuclideanGeometry

variable {V : Type*}

abbrev K133 := SimpleGraph.completeMultipartiteGraph fun i : Fin 3 => Fin (![1, 3, 3] i)

theorem erdos_1007.variants.dimension_five_extremal :
    ((SimpleGraph.completeGraph (Fin 6)).HasDimension 5 ∧ (SimpleGraph.completeGraph (Fin 6)).edgeSet.ncard = 15) ∧ (K133.HasDimension 5 ∧ K133.edgeSet.ncard = 15) := by
  sorry

end Erdos1007
