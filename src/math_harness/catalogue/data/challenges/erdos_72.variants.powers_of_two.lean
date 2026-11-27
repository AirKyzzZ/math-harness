import Mathlib

open Filter SimpleGraph

namespace Erdos72

open scoped Classical in
theorem erdos_72.variants.powers_of_two :
    ∃ c : ℚ, 0 < c ∧ ∀ᶠ n : ℕ in atTop, ∀ G : SimpleGraph (Fin n), c ≤ G.averageDegree → ∃ (v : Fin n) (w : G.Walk v v), w.IsCycle ∧ ∃ k : ℕ, w.length = 2 ^ k := by
  sorry

end Erdos72
