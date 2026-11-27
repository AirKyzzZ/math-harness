import Mathlib

open Nat Set

namespace Erdos1141

noncomputable def residuePrimeUpperBound (m : ℕ) (ε : ℝ) : ℝ := (m : ℝ) ^ ((1 / 4 : ℝ) + ε)

noncomputable def residuePrimesUpTo (m : ℕ) (χ : DirichletCharacter ℂ m) (ε : ℝ) : Finset ℕ := by
  classical
  exact (Finset.range (⌈residuePrimeUpperBound m ε⌉₊ + 1)).filter fun ℓ =>
    ℓ.Prime ∧ (ℓ : ℝ) ≤ residuePrimeUpperBound m ε ∧ χ (ℓ : ZMod m) = 1

def Erdos1141Prop (n : ℕ) : Prop :=
  ∀ k, k ^ 2 < n → Coprime n k → (n - k ^ 2).Prime

instance (n : ℕ) : Decidable (Erdos1141Prop n) :=
  decidable_of_iff (∀ k ≤ .sqrt (n - 1), Coprime n k → (n - k ^ 2).Prime) <| by
    cases n with
    | zero => simp [Erdos1141Prop]
    | succ n' =>
      simp [Erdos1141Prop, le_sqrt, pow_two]

theorem erdos_1141 :
    ¬ Infinite { n | Erdos1141Prop n } := by
  sorry

example : ¬ Erdos1141Prop 968 := by
  decide +native

example : Erdos1141Prop 1722 := by
  decide +native

end Erdos1141
