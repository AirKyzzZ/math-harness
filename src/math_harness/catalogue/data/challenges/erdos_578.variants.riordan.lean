import Mathlib

open Filter SimpleGraph

namespace Erdos578

theorem erdos_578.variants.riordan (p : unitInterval) (hp : (1 : ℝ) / 4 < p) :
    Tendsto (fun d : ℕ => binomialRandom (Fin d → Bool) p {G | (hypercube d).IsContained G}) atTop (nhds 1) := by
  sorry

end Erdos578
