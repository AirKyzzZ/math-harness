import Mathlib

open Filter Asymptotics

namespace Erdos1162

noncomputable def f (n : ℕ) : ℕ := Nat.card (Subgroup (Equiv.Perm (Fin n)))

theorem f_pos (n : ℕ) : 0 < f n := by
  unfold f
  exact Nat.card_pos

theorem erdos_1162.variants.roney_dougal_tracey :
    (fun n : ℕ ↦ Real.logb 2 (f n : ℝ)) ~[atTop] fun n : ℕ ↦ (n : ℝ) ^ 2 / 16 := by
  sorry

end Erdos1162
