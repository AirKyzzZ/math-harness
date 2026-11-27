import Mathlib

open Filter Asymptotics

namespace Erdos237

noncomputable def f (A : Set ℕ) (n : ℕ) : ℕ :=
  {a ∈ A | a ≤ n ∧ (n - a).Prime}.ncard

theorem erdos_237.variants.pow_two :
    limsup (fun n ↦ (f (Set.range (2 ^ ·)) n : ℕ∞)) atTop = ⊤ := by
  sorry

end Erdos237
