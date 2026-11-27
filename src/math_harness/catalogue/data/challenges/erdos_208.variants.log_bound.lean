import Mathlib

open Filter Real

namespace Erdos208

noncomputable def erdos208.s : ℕ → ℕ := Nat.nth Squarefree

open erdos208

theorem erdos_208.variants.log_bound :
    (fun n ↦ (s (n + 1) - s n : ℝ)) =O[atTop] fun n ↦ log (s n) := by
  sorry

end Erdos208
