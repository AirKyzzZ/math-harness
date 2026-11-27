import Mathlib

open Filter

namespace Erdos495

theorem erdos_495_neg :
    ¬ (∀ α β : ℝ, liminf (fun n : ℕ ↦ (n : ℝ) * distToNearestInt (n * α) * distToNearestInt (n * β)) atTop = 0) := by
  sorry

end Erdos495
