import Mathlib

open Filter Finset EuclideanGeometry

namespace Erdos654

theorem erdos_654.parts.i_neg :
    ¬ (¬ ∀ ε > (0 : ℝ), ∀ᶠ n : ℕ in atTop, ∀ A : Finset ℝ², #A = n → NoFourConcyclic A → ∃ x ∈ A, (1 - ε) * (n : ℝ) < (distinctDistancesFrom A x : ℝ)) := by
  sorry

theorem erdos_654.variants.trivial_bound (A : Finset ℝ²) (hA : NoFourConcyclic A) :
    ∀ x ∈ A, ((#A : ℝ) - 1) / 3 ≤ (distinctDistancesFrom A x : ℝ) := by
  intro x hx
  have hfib : ∀ d ∈ (A.erase x).image (fun y ↦ dist y x),
      #{y ∈ A.erase x | dist y x = d} ≤ 3 := by
    intro d _
    by_contra! h4
    obtain ⟨T, hT, hT4⟩ := Finset.exists_subset_card_eq h4
    refine hA (T : Set ℝ²) (fun y hy ↦ ?_) (by rw [Set.ncard_coe_finset, hT4])
      ⟨x, d, fun y hy ↦ (Finset.mem_filter.1 (hT (Finset.mem_coe.1 hy))).2⟩
    exact Finset.mem_of_mem_erase (Finset.mem_filter.1 (hT (Finset.mem_coe.1 hy))).1
  have hle := Finset.card_le_mul_card_image (A.erase x) 3 hfib
  rw [Finset.card_erase_of_mem hx] at hle
  have h1 : 1 ≤ #A := Finset.card_pos.2 ⟨x, hx⟩
  have hle' : #A - 1 ≤ 3 * distinctDistancesFrom A x := by
    unfold distinctDistancesFrom
    convert hle using 3
    ext d
    simp
  have : ((#A - 1 : ℕ) : ℝ) ≤ 3 * (distinctDistancesFrom A x : ℝ) := by
    exact_mod_cast hle'
  rw [Nat.cast_sub h1, Nat.cast_one] at this
  linarith

def AtMostTwoPerCircle (A : Finset ℝ²) : Prop :=
  ∀ x ∈ A, ∀ r : ℝ, #((A.erase x).filter fun y ↦ dist y x = r) ≤ 2

end Erdos654
