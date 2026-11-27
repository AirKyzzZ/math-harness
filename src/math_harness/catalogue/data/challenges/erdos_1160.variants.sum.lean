import Mathlib

open Filter

namespace Erdos1160

noncomputable def g (n : ℕ) : ℕ :=
  (Quotient.mk (CategoryTheory.isIsomorphicSetoid FiniteGrp.{0}) ''
    {G : FiniteGrp.{0} | Nat.card G = n}).ncard

theorem g_zero : g 0 = 0 := by
  have h : {G : FiniteGrp.{0} | Nat.card G = 0} = ∅ :=
    Set.eq_empty_of_forall_notMem fun G hG ↦ Nat.card_pos.ne' hG
  simp [g, h]

theorem erdos_1160.variants.sum :
    ∀ᶠ m : ℕ in atTop, ∑ n ∈ Finset.Ico 1 (2 ^ m), g n ≤ g (2 ^ m) := by
  sorry

end Erdos1160
