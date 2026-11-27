import Mathlib

open Filter Asymptotics

namespace Erdos240

noncomputable def a (P : Set ℕ) (i : ℕ) : ℕ :=
  Nat.nth (· ∈ Erdos675.composedOf P) i

theorem erdos_240.variants.tijdeman_epsilon (ε : ℝ) (hε : 0 < ε) :
    ∃ P : Set ℕ, P.Infinite ∧ P ⊆ {p : ℕ | p.Prime} ∧ (fun i ↦ (a P i : ℝ) ^ (1 - ε)) =O[atTop] (fun i ↦ ((a P (i + 1) - a P i : ℕ) : ℝ)) := by
  sorry

end Erdos240
