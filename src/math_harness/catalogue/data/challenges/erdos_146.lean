import Mathlib

open Filter SimpleGraph

namespace Erdos146

theorem erdos_146 :
    ¬ ∀ (r q : ℕ) (H : SimpleGraph (Fin q)), 0 < r → H.IsBipartite → H.IsDegenerate r → Asymptotics.IsBigO atTop (fun n : ℕ => (extremalNumber n H : ℝ)) (fun n : ℕ => (n : ℝ) ^ ((2 : ℝ) - 1 / (r : ℝ))) := by
  sorry

end Erdos146
