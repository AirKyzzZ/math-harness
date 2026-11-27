import Mathlib

open Filter Asymptotics

namespace Erdos237

noncomputable def f (A : Set ℕ) (n : ℕ) : ℕ :=
  {a ∈ A | a ≤ n ∧ (n - a).Prime}.ncard

theorem erdos_237 :
    ∀ A : Set ℕ, (fun N : ℕ ↦ Real.log N) =O[atTop] (fun N ↦ ((A ∩ .Icc 1 N).ncard : ℝ)) → limsup (fun n ↦ (f A n : ℕ∞)) atTop = ⊤ := by
  sorry

end Erdos237
