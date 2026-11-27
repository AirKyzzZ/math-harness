import Mathlib

open Filter

open scoped Asymptotics

namespace Erdos323

noncomputable def f (k m x : ℕ) : ℕ :=
  { n : ℕ | n ≤ x ∧ ∃ (v : Fin m → ℕ), n = ∑ i, v i ^ k }.ncard

theorem erdos_323.parts.i :
    ∀ k ≥ 1, ∀ ε > (0 : ℝ), (fun (x : ℕ) ↦ (x : ℝ) ^ (1 - ε)) =O[atTop] (fun (x : ℕ) ↦ (f k k x : ℝ)) := by
  sorry

end Erdos323
