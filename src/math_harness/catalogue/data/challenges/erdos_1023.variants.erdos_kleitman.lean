import Mathlib

open Filter

open scoped Asymptotics

namespace Erdos1023

noncomputable def F (n : ℕ) : ℕ :=
  sSup {m | ∃ S ⊆ (Finset.Icc 1 n).powerset, S.SubfamilyUnionFree ∧ S.card = m}

theorem erdos_1023.variants.erdos_kleitman :
    (fun n : ℕ => (F n : ℝ)) =Θ[atTop] (fun n : ℕ => (2 : ℝ) ^ n / (n : ℝ) ^ (1 / 2 : ℝ)) := by
  sorry

end Erdos1023
