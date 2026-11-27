import Mathlib

open Filter Real

namespace Erdos208

noncomputable def erdos208.s : ℕ → ℕ := Nat.nth Squarefree

open erdos208

theorem erdos_208.parts.i :
    ∀ ε > (0 : ℝ), (fun n => (s (n + 1) - s n : ℝ)) =O[atTop] (fun n => (s n : ℝ)^ε) := by
  sorry

end Erdos208
