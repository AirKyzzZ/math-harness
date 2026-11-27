import Mathlib

namespace Erdos560

open Filter SimpleGraph

open scoped Asymptotics

local notation "r̂(" n ")" =>

  sizeRamsey (completeBipartiteGraph (Fin n) (Fin n))

    (completeBipartiteGraph (Fin n) (Fin n))

theorem erdos_560.variants.lower_bound :
    ∀ (n : ℕ), 6 ≤ n → (1 / 60 : ℝ) * (n : ℝ) ^ 2 * 2 ^ n < r̂(n) := by
  sorry

end Erdos560
