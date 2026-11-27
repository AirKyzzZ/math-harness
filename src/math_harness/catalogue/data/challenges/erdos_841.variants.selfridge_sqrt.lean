import Mathlib

open Filter Real Topology

namespace Erdos841

noncomputable def t (n : ℕ) : ℕ :=
  sInf {T | ∃ J ⊆ Finset.Icc 1 T, IsSquare (n * ∏ j ∈ J, (n + j))}

theorem erdos_841.variants.selfridge_sqrt :
    ∃ C : ℝ, ∀ n : ℕ, (n.maxPrimeFac : ℝ) ≤ √(2 * n) + 1 → (t n : ℝ) ≤ C * √n := by
  sorry

end Erdos841
