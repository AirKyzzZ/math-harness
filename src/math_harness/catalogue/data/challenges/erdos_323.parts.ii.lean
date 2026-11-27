import Mathlib

open Filter

open scoped Asymptotics

namespace Erdos323

noncomputable def f (k m x : ℕ) : ℕ :=
  { n : ℕ | n ≤ x ∧ ∃ (v : Fin m → ℕ), n = ∑ i, v i ^ k }.ncard

theorem erdos_323.parts.ii :
    ∀ k m : ℕ, 1 ≤ m → m < k → (fun (x : ℕ) ↦ (x : ℝ) ^ ((m : ℝ) / (k : ℝ))) =O[atTop] (fun (x : ℕ) ↦ (f k m x : ℝ)) := by
  sorry

end Erdos323
