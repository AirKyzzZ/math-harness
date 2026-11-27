import Mathlib

namespace Erdos970

def IsJacobsthalBound (k m : ℕ) : Prop :=
  ∀ n : ℕ, 0 < n → n.primeFactors.card ≤ k →
    ∀ a : ℤ, ∃ i : ℕ, i < m ∧ (a + i).natAbs.Coprime n

noncomputable def jacobsthalFunction (k : ℕ) : ℕ :=
  sInf {m : ℕ | IsJacobsthalBound k m}

theorem erdos_970_neg :
    ¬ (∃ C > (0 : ℝ), ∀ k : ℕ, 0 < k → (jacobsthalFunction k : ℝ) ≤ C * k ^ 2) := by
  sorry

end Erdos970
