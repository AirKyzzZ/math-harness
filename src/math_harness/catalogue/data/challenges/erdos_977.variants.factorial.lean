import Mathlib

open Filter

namespace Erdos977

theorem erdos_977.variants.factorial :
    Tendsto (fun n : ℕ ↦ (Nat.maxPrimeFac (n.factorial + 1) : ℝ) / n) atTop atTop := by
  sorry

end Erdos977
