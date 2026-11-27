import Mathlib

open Filter

open scoped Topology

namespace Erdos1089

noncomputable def g (d n : ℕ) : ℕ :=
  sInf {m : ℕ | n ≤ minimalDistinctDistances (EuclideanSpace ℝ (Fin d)) m}

theorem erdos_1089.variants.bounds_and_limit (n : ℕ) (hn : 2 ≤ n) :
    (∀ d, 1 ≤ d → (d + 1).choose (n - 1) + 1 ≤ g d n ∧ g d n ≤ (d + n - 1).choose (n - 1) + 1) ∧ Tendsto (fun d : ℕ => (g d n : ℝ) / (d : ℝ) ^ (n - 1)) atTop (𝓝 ((1 : ℝ) / (n - 1).factorial)) := by
  sorry

end Erdos1089
