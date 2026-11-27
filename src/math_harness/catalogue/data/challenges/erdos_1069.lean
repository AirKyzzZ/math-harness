import Mathlib

open EuclideanGeometry

namespace Erdos1069

def richLines (s : Finset ℝ²) (k : ℕ) : Set (AffineSubspace ℝ ℝ²) :=
  {L | IsLine L ∧ k ≤ ((s : Set ℝ²) ∩ (L : Set ℝ²)).ncard}

theorem richLines_finite (s : Finset ℝ²) {k : ℕ} (hk : 2 ≤ k) : (richLines s k).Finite := by
  refine (Erdos211.determinedLines s).finite_toSet.subset ?_
  rintro L ⟨hL, hcard⟩
  exact Finset.mem_coe.2 (Erdos211.determinedLines_eq.2 ⟨hL, hk.trans hcard⟩)

theorem erdos_1069 :
    ∃ C : ℝ, 0 < C ∧ ∀ (n k : ℕ) (s : Finset ℝ²), s.card = n → 2 ≤ k → (k : ℝ) ≤ Real.sqrt n → ((richLines s k).ncard : ℝ) ≤ C * (n : ℝ) ^ 2 / (k : ℝ) ^ 3 := by
  sorry

end Erdos1069
