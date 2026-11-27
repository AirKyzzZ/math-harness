import Mathlib

open Filter

open scoped Asymptotics

namespace Erdos1023

noncomputable def F (n : ℕ) : ℕ :=
  sSup {m | ∃ S ⊆ (Finset.Icc 1 n).powerset, S.SubfamilyUnionFree ∧ S.card = m}

theorem erdos_1023_neg :
    ¬ (∃ c : ℝ, 0 < c ∧ ((fun n : ℕ => (F n : ℝ)) ~[atTop] (fun n : ℕ => c * 2 ^ n / (n : ℝ) ^ (1 / 2 : ℝ)))) := by
  sorry

end Erdos1023
