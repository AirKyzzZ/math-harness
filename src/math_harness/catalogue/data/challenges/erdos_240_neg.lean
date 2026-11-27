import Mathlib

open Filter Asymptotics

namespace Erdos240

noncomputable def a (P : Set ℕ) (i : ℕ) : ℕ :=
  Nat.nth (· ∈ Erdos675.composedOf P) i

theorem erdos_240_neg :
    ¬ (∃ P : Set ℕ, P.Infinite ∧ P ⊆ {p : ℕ | p.Prime} ∧ Tendsto (fun i ↦ a P (i + 1) - a P i) atTop atTop) := by
  sorry

end Erdos240
