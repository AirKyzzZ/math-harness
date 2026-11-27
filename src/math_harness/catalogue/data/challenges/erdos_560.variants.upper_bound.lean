import Mathlib

namespace Erdos560

open Filter SimpleGraph

open scoped Asymptotics

local notation "r̂(" n ")" =>

  sizeRamsey (completeBipartiteGraph (Fin n) (Fin n))

    (completeBipartiteGraph (Fin n) (Fin n))

theorem erdos_560.variants.upper_bound :
    ∀ (n : ℕ), 1 ≤ n → (r̂(n) : ℝ) < (3 / 2 : ℝ) * (n : ℝ) ^ 3 * 2 ^ n := by
  sorry

end Erdos560
