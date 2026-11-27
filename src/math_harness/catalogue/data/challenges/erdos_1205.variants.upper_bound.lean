import Mathlib

open Filter Asymptotics

namespace Erdos1205

abbrev Assignment (x : ℕ) := (i : Fin x) → Fin (i.1 + 1)

def Covers {x : ℕ} (a : Assignment x) (m i : Fin x) : Prop :=
  (m.1 + 1) % (i.1 + 1) = (a i).1

noncomputable def coverage {x : ℕ} (a : Assignment x) (m : Fin x) : ℕ :=
  open scoped Classical in
  ((Finset.univ : Finset (Fin x)).filter fun i ↦ Covers a m i).card

def IsCovering (x k : ℕ) : Prop :=
  k ≤ x ∧ ∃ a : Assignment x, ∀ m : Fin x, k ≤ coverage a m

noncomputable def F (x : ℕ) : ℕ :=
  open scoped Classical in
  Nat.findGreatest (IsCovering x) x

theorem covers_iff_modEq {x : ℕ} (a : Assignment x) (m i : Fin x) :
    Covers a m i ↔ (m.1 + 1) ≡ (a i).1 [MOD i.1 + 1] := by
  unfold Covers Nat.ModEq
  rw [Nat.mod_eq_of_lt (a i).2]

theorem F_zero : F 0 = 0 := by
  classical
  exact Nat.findGreatest_zero

noncomputable def erdos_1205.answer (x : ℕ) : ℝ := Real.log x

theorem erdos_1205.variants.upper_bound (x : ℕ) :
    (F x : ℝ) ≤ (harmonic x : ℝ) + 1 := by
  sorry

end Erdos1205
