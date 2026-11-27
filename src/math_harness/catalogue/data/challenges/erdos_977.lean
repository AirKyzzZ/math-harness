import Mathlib

open Filter

namespace Erdos977

theorem erdos_977 :
    Tendsto (fun n : ℕ ↦ (Nat.maxPrimeFac (2 ^ n - 1) : ℝ) / n) atTop atTop := by
  sorry

end Erdos977
