import Mathlib

open Filter

open scoped Asymptotics

namespace Erdos1023

noncomputable def F (n : ℕ) : ℕ :=
  sSup {m | ∃ S ⊆ (Finset.Icc 1 n).powerset, S.SubfamilyUnionFree ∧ S.card = m}

theorem erdos_1023.variants.hunter :
    (fun n : ℕ => (F n : ℝ)) ~[atTop] (fun n : ℕ => (n.choose (n / 2) : ℝ)) := by
  sorry

end Erdos1023
