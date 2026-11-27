import Mathlib

open Filter Polynomial

namespace Erdos485

noncomputable def f (k : ℕ) : ℕ :=
  sInf {m | ∃ P : ℚ[X], P.support.card = k ∧ (P ^ 2).support.card = m}

theorem erdos_485_neg :
    ¬ (Tendsto f atTop atTop) := by
  sorry

end Erdos485
