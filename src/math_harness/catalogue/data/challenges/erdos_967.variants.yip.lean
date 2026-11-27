import Mathlib

open Filter

open scoped Topology

namespace Erdos967

noncomputable def summand (t : ℝ) (n : ℕ) : ℂ := 1 / (n : ℂ) ^ (1 + t * Complex.I : ℂ)

theorem erdos_967.variants.yip (t : ℝ) (ht : t ≠ 0) :
    ∃ a : ℕ → ℕ, StrictMono a ∧ 1 < a 0 ∧ Summable (fun k : ℕ => 1 / (a k : ℝ)) ∧ (1 + (∑' k, summand t (a k)) = 0) := by
  sorry

end Erdos967
