import Mathlib

open Filter Asymptotics

namespace Erdos1162

noncomputable def f (n : ℕ) : ℕ := Nat.card (Subgroup (Equiv.Perm (Fin n)))

theorem f_pos (n : ℕ) : 0 < f n := by
  unfold f
  exact Nat.card_pos

theorem erdos_1162.variants.pyber :
    (fun n : ℕ ↦ Real.log (f n : ℝ)) =Θ[atTop] fun n : ℕ ↦ (n : ℝ) ^ 2 := by
  sorry

end Erdos1162
