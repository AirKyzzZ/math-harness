import Mathlib

namespace Erdos711

open Filter Asymptotics

def HasDivisibleDistinctTuple (n m L : ℕ) : Prop :=
  ∃ a : Fin n → ℕ,
    Function.Injective a ∧
      ∀ i : Fin n, m < a i ∧ a i < m + L ∧ (i.val + 1) ∣ a i

def IsMinimalIntervalLength (n m L : ℕ) : Prop :=
  HasDivisibleDistinctTuple n m L ∧
    ∀ L', HasDivisibleDistinctTuple n m L' → L ≤ L'

theorem erdos_711.parts.i_neg :
    ¬ (∃ error : ℕ → ℝ, error =o[atTop] (fun _ ↦ (1 : ℝ)) ∧ ∀ᶠ n in atTop, ∀ m, ∃ L, HasDivisibleDistinctTuple n m L ∧ (L : ℝ) ≤ Real.rpow n (1 + error n)) := by
  sorry

-- TODO: Formalize the Erdős–Pomerance bounds and van Doorn's stronger quantitative theorem.

end Erdos711
