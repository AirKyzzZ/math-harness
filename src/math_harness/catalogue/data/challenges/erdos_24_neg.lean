import Mathlib

open SimpleGraph

namespace Erdos24

theorem erdos_24_neg :
    ¬ (∀ (n : ℕ) (G : SimpleGraph (Fin (5 * n))), G.CliqueFree 3 → G.copyCount (cycleGraph 5) ≤ n ^ 5) := by
  sorry

end Erdos24
