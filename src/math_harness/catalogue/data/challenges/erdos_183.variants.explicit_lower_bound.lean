import Mathlib

open Filter

open scoped Topology

namespace Erdos183

def ForcesMonochromaticTriangle (n k : ℕ) : Prop :=
  ∀ C : SimpleGraph.TopEdgeLabeling (Fin n) (Fin k), ¬ C.CliqueFree 3

noncomputable def multicolourTriangleRamsey (k : ℕ) : ℕ :=
  sInf {n : ℕ | ForcesMonochromaticTriangle n k}

theorem erdos_183.variants.explicit_lower_bound :
    ∀ k : ℕ, 2 ≤ k → (((1 : ℝ) / (6 * Real.exp 38)) * (k : ℝ) ^ ((1 : ℝ) / 3) / Real.log (k : ℝ)) ^ k ≤ (multicolourTriangleRamsey k : ℝ) := by
  sorry

end Erdos183
