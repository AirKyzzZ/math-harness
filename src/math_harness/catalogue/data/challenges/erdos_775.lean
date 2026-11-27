import Mathlib

open Filter

namespace Erdos775

theorem erdos_775 :
    ¬ ∃ C : ℕ, ∃ᶠ n : ℕ in atTop, ∃ H : UniformHypergraph (Fin n) 3, n - C ≤ (UniformHypergraph.cliqueSizes H).ncard := by
  sorry

end Erdos775
