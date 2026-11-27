import Mathlib

open Filter SimpleGraph

open scoped Topology

namespace Erdos554

theorem multicolourGraphRamsey_completeGraph_three (k : ℕ) :
    multicolourGraphRamsey k (completeGraph (Fin 3)) = Erdos183.multicolourTriangleRamsey k := by
  simp only [multicolourGraphRamsey, Erdos183.multicolourTriangleRamsey,
    Erdos183.ForcesMonochromaticTriangle, TopEdgeLabeling.CliqueFree, not_forall,
    not_cliqueFree_iff_top_isContained]

theorem multicolourGraphRamsey_cycleGraph_three (k : ℕ) :
    multicolourGraphRamsey k (cycleGraph 3) = multicolourGraphRamsey k (completeGraph (Fin 3)) :=
  congrArg (multicolourGraphRamsey k) cycleGraph_three_eq_top

theorem erdos_554.variants.jenssen_skokan :
    ∀ k : ℕ, 2 ≤ k → ∀ᶠ n : ℕ in atTop, multicolourGraphRamsey k (cycleGraph (2 * n + 1)) = n * 2 ^ k + 1 := by
  sorry

end Erdos554
