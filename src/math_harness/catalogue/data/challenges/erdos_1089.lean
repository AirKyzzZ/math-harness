import Mathlib

open Filter

open scoped Topology

namespace Erdos1089

noncomputable def g (d n : ℕ) : ℕ :=
  sInf {m : ℕ | n ≤ minimalDistinctDistances (EuclideanSpace ℝ (Fin d)) m}

theorem erdos_1089 :
    ∀ n : ℕ, 2 ≤ n → ∃ L : ℝ, Tendsto (fun d : ℕ => (g d n : ℝ) / (d : ℝ) ^ (n - 1)) atTop (𝓝 L) := by
  sorry

end Erdos1089
