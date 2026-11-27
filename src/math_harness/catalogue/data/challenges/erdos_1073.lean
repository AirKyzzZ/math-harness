import Mathlib

open Nat Filter

namespace Erdos1073

noncomputable def A (x : ℕ) : ℝ := {u | u.Composite ∧ ∃ n, n ! + 1 ≡ 0 [MOD u] ∧ u < x}.ncard

theorem erdos_1073 :
    ∃ (o : ℕ → ℝ), o =o[atTop] (1 : ℕ → ℝ) ∧ ∀ x, A x ≤ x ^ (o x) := by
  sorry

end Erdos1073
