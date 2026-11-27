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

theorem erdos_711.parts.ii_neg :
    ¬ (∀ B : ℕ, ∀ᶠ n in atTop, ∃ m Lm Ln : ℕ, IsMinimalIntervalLength n m Lm ∧ IsMinimalIntervalLength n n Ln ∧ B ≤ Lm - Ln) := by
  sorry

-- TODO: Formalize the Erdős–Pomerance bounds and van Doorn's stronger quantitative theorem.

end Erdos711
