import Mathlib

open Nat Set Filter

open scoped Topology

namespace Erdos417

theorem erdos_417.parts.ii :
    ∃ L > (1 : ENNReal), Tendsto (fun x ↦ ({ k | k ∈ range totient ∧ (k : ℝ) ≤ x }.ncard : ENNReal) / ((totient '' { m | 1 ≤ m ∧ (m : ℝ) ≤ x }).ncard : ENNReal)) atTop (𝓝 L) := by
  sorry

end Erdos417
