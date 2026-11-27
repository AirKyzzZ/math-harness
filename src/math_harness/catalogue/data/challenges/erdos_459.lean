import Mathlib

namespace Erdos459

noncomputable def f (u : ℕ) : ℕ := sInf {v | u < v ∧ v.primeFactors ⊆ u.primeFactors}

theorem erdos_459 {u : ℕ} (hu : 2 ≤ u) :
    u + 2 ≤ f u ∧ f u ≤ u ^ 2 := by
  sorry

end Erdos459
