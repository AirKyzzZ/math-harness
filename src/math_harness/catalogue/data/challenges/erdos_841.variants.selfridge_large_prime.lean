import Mathlib

open Filter Real Topology

namespace Erdos841

noncomputable def t (n : ℕ) : ℕ :=
  sInf {T | ∃ J ⊆ Finset.Icc 1 T, IsSquare (n * ∏ j ∈ J, (n + j))}

theorem erdos_841.variants.selfridge_large_prime (n : ℕ) (hn : 1 < n) (h : √(2 * n) + 1 < (n.maxPrimeFac : ℝ)) :
    t n = n.maxPrimeFac := by
  sorry

end Erdos841
