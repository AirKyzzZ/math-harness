import Mathlib

namespace Erdos560

open Filter SimpleGraph

open scoped Asymptotics

local notation "r̂(" n ")" =>

  sizeRamsey (completeBipartiteGraph (Fin n) (Fin n))

    (completeBipartiteGraph (Fin n) (Fin n))

theorem erdos_560.variants.conlon_fox_wigderson :
    (fun n : ℕ ↦ (r̂(n) : ℝ)) =Θ[atTop] (fun n : ℕ ↦ (n : ℝ) ^ 3 * 2 ^ n) := by
  sorry

end Erdos560
