import Mathlib

open Filter Asymptotics

namespace Erdos237

noncomputable def f (A : Set ℕ) (n : ℕ) : ℕ :=
  {a ∈ A | a ≤ n ∧ (n - a).Prime}.ncard

theorem erdos_237.variants.infinite (A : Set ℕ) (hA : A.Infinite) :
    limsup (fun n ↦ (f A n : ℕ∞)) atTop = ⊤ := by
  sorry

end Erdos237
