import Mathlib

open Filter

open scoped Topology

namespace Erdos183

def ForcesMonochromaticTriangle (n k : ℕ) : Prop :=
  ∀ C : SimpleGraph.TopEdgeLabeling (Fin n) (Fin k), ¬ C.CliqueFree 3

noncomputable def multicolourTriangleRamsey (k : ℕ) : ℕ :=
  sInf {n : ℕ | ForcesMonochromaticTriangle n k}

theorem erdos_183 :
    Tendsto (fun k : ℕ => (multicolourTriangleRamsey k : ℝ) ^ ((1 : ℝ) / (k : ℝ))) atTop atTop := by
  sorry

end Erdos183
