import Mathlib

open Filter

open scoped Asymptotics Finset

namespace Erdos539

def IsCofactorLowerBound (n m : ℕ) : Prop := ∀ A : Finset ℕ, #A = n →
  m ≤ #((A ×ˢ A).image fun (a, b) ↦ a / a.gcd b)

noncomputable def cofactorThreshold (n : ℕ) : ℕ :=
  sSup {m | IsCofactorLowerBound n m}

theorem erdos_539.variants.sq_cube_root :
    ¬ ((fun n ↦ (cofactorThreshold n : ℝ)) =Θ[atTop] fun n ↦ (n : ℝ) ^ ((2 : ℝ) / 3)) := by
  sorry

noncomputable def erdos_539.variants.limit.answer : Filter ℝ := nhds ((1 : ℝ) / 2)

end Erdos539
