import Mathlib

open Filter Asymptotics

namespace Erdos240

noncomputable def a (P : Set ℕ) (i : ℕ) : ℕ :=
  Nat.nth (· ∈ Erdos675.composedOf P) i

theorem erdos_240.variants.tijdeman_finite {P : Set ℕ} (hP : P.Finite) (hne : P.Nonempty) (hpr : P ⊆ {p : ℕ | p.Prime}) :
    ∃ C : ℝ, 0 < C ∧ (fun i ↦ (a P i : ℝ) / Real.log (a P i : ℝ) ^ C) =O[atTop] (fun i ↦ ((a P (i + 1) - a P i : ℕ) : ℝ)) := by
  sorry

end Erdos240
