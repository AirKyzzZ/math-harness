import Mathlib

open Filter SimpleGraph

namespace Erdos72

open scoped Classical in
theorem erdos_72 :
    ∃ A : Set ℕ, A.HasDensity 0 ∧ ∃ c : ℚ, 0 < c ∧ ∀ᶠ n : ℕ in atTop, ∀ G : SimpleGraph (Fin n), c ≤ G.averageDegree → ∃ (v : Fin n) (w : G.Walk v v), w.IsCycle ∧ w.length ∈ A := by
  sorry

end Erdos72
