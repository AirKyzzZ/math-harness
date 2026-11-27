import Mathlib

namespace Erdos459

noncomputable def f (u : ℕ) : ℕ := sInf {v | u < v ∧ v.primeFactors ⊆ u.primeFactors}

theorem erdos_459.variants.upper_tight {p : ℕ} (hp : p.Prime) :
    f p = p ^ 2 := by
  sorry

end Erdos459
