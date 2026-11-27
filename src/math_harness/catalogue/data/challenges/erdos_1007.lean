import Mathlib

namespace Erdos1007

open scoped EuclideanGeometry

variable {V : Type*}

abbrev K133 := SimpleGraph.completeMultipartiteGraph fun i : Fin 3 => Fin (![1, 3, 3] i)

theorem erdos_1007 :
    IsLeast {m | ∃ (n : ℕ) (G : SimpleGraph (Fin n)), G.HasDimension 4 ∧ G.edgeSet.ncard = m} 9 := by
  sorry

end Erdos1007
