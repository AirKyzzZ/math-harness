import Mathlib

namespace Erdos102

open EuclideanGeometry Filter

open scoped Classical in
noncomputable def pointsOn (P : Finset ℝ²) (L : AffineSubspace ℝ ℝ²) : ℕ :=
  (P.filter (· ∈ L)).card

noncomputable def richLineCount (P : Finset ℝ²) : ℕ :=
  {L : AffineSubspace ℝ ℝ² | IsLine L ∧ 3 < pointsOn P L}.ncard

def Admissible (c : ℝ) (n : ℕ) (P : Finset ℝ²) : Prop :=
  P.card = n ∧ c * (n : ℝ) ^ 2 ≤ richLineCount P

noncomputable def maxCollinear (P : Finset ℝ²) : ℕ :=
  sSup {k : ℕ | ∃ L, IsLine L ∧ pointsOn P L = k}

noncomputable def h (c : ℝ) (n : ℕ) : ℕ∞ :=
  ⨅ (P : Finset ℝ²) (_ : Admissible c n P), (maxCollinear P : ℕ∞)

theorem exists_line : ∃ L : AffineSubspace ℝ ℝ², IsLine L := by
  refine ⟨AffineSubspace.mk' 0 (Submodule.span ℝ {EuclideanSpace.single 0 1}), ?_⟩
  unfold IsLine
  rw [AffineSubspace.direction_mk']
  apply finrank_span_singleton
  simp

theorem le_maxCollinear_iff (P : Finset ℝ²) (M : ℕ) :
    M ≤ maxCollinear P ↔ ∃ L, IsLine L ∧ M ≤ pointsOn P L := by
  have hbdd : BddAbove {k : ℕ | ∃ L, IsLine L ∧ pointsOn P L = k} := by
    refine ⟨P.card, ?_⟩
    rintro k ⟨L, -, rfl⟩
    classical
    exact Finset.card_filter_le _ _
  have hne : {k : ℕ | ∃ L, IsLine L ∧ pointsOn P L = k}.Nonempty := by
    obtain ⟨L, hL⟩ := exists_line
    exact ⟨_, L, hL, rfl⟩
  constructor
  · intro hM
    obtain ⟨L, hL, hk⟩ := Nat.sSup_mem hne hbdd
    exact ⟨L, hL, hk ▸ hM⟩
  · rintro ⟨L, hL, hM⟩
    exact hM.trans (le_csSup hbdd ⟨L, hL, rfl⟩)

theorem le_h_iff (c : ℝ) (n M : ℕ) :
    (M : ℕ∞) ≤ h c n ↔
      ∀ P : Finset ℝ², Admissible c n P → ∃ L, IsLine L ∧ M ≤ pointsOn P L := by
  simp only [h, le_iInf_iff, Nat.cast_le]
  refine forall_congr' fun P => imp_congr_right fun _ => ?_
  exact le_maxCollinear_iff P M

theorem tendsto_h_iff (c : ℝ) :
    (∀ M : ℕ, ∀ᶠ n in atTop, (M : ℕ∞) ≤ h c n) ↔
      ∀ M : ℕ, ∀ᶠ n in atTop, ∀ P : Finset ℝ², P.card = n →
        c * (n : ℝ) ^ 2 ≤ richLineCount P → ∃ L, IsLine L ∧ M ≤ pointsOn P L := by
  refine forall_congr' fun M => eventually_congr (Eventually.of_forall fun n => ?_)
  rw [le_h_iff]
  exact forall_congr' fun P => ⟨fun hP hcard hrich => hP ⟨hcard, hrich⟩,
    fun hP hadm => hP hadm.1 hadm.2⟩

theorem erdos_102.variants.five :
    ∀ c > 0, ∀ᶠ n in atTop, (5 : ℕ∞) ≤ h c n := by
  sorry

end Erdos102
