import Mathlib

open SimpleGraph

namespace Erdos557

theorem erdos_557 :
    ∃ c : ℕ, ∀ (k n : ℕ) (T : SimpleGraph (Fin n)), T.IsTree → multicolourGraphRamsey k T ≤ k * n + c := by
  sorry

end Erdos557
