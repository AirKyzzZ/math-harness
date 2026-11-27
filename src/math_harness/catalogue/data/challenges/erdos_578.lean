import Mathlib

open Filter SimpleGraph

namespace Erdos578

theorem erdos_578 :
    Tendsto (fun d : ℕ => binomialRandom (Fin d → Bool) ⟨1 / 2, by norm_num⟩ {G | (hypercube d).IsContained G}) atTop (nhds 1) := by
  sorry

end Erdos578
