import Mathlib

namespace Erdos906

theorem erdos_906_neg :
    ¬ (∃ f : ℂ → ℂ, Transcendental (Polynomial ℂ) f ∧ Differentiable ℂ f ∧ ∀ n : ℕ → ℕ, StrictMono n → Dense { z | ∃ k, iteratedDeriv (n k) f z = 0 }) := by
  sorry

end Erdos906
