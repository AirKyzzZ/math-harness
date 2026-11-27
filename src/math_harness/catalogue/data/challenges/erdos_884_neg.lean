import Mathlib

namespace Erdos884

noncomputable abbrev sumDivisorInvPairwiseDifference (n : ℕ) : ℝ :=
    ∑ j : Fin n.divisors.card, ∑ i : Fin  j,
    (1 : ℚ) / (Nat.nth (· ∣ n) j - Nat.nth (· ∣ n) i )

noncomputable abbrev sumDivisorInvConsecutiveDifference (n : ℕ) : ℝ :=
    ∑ i : Fin (n.divisors.card - 1),
    (1 : ℚ) / (Nat.nth (· ∣ n) (i + 1) - Nat.nth (· ∣ n) i)

def Erdos884Prop : Prop :=
    sumDivisorInvPairwiseDifference ≪ 1 + sumDivisorInvConsecutiveDifference

theorem erdos_884_neg :
    ¬ (¬ Erdos884Prop) := by
  sorry

end Erdos884
