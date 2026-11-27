import Mathlib

open Filter

namespace Erdos775

theorem erdos_775.variants.gao :
    ∃ f : ℕ → ℕ, Tendsto f atTop atTop ∧ ∀ᶠ n : ℕ in atTop, ∀ H : UniformHypergraph (Fin n) 3, (UniformHypergraph.cliqueSizes H).ncard + f n ≤ n := by
  sorry

end Erdos775
