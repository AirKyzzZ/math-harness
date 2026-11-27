import Mathlib

open Filter

namespace Erdos852

def DistinctGapRun (n H : ℕ) : Prop :=
  Set.InjOn primeGap (Set.Ico n (n + H))

theorem distinctGapRun_zero_two : DistinctGapRun 0 2 := by
  have h0 : primeGap 0 = 1 := by simp [primeGap]
  have h1 : primeGap 1 = 2 := by simp [primeGap]
  intro a ha b hb hab
  simp only [Set.mem_Ico] at ha hb
  have ha' : a = 0 ∨ a = 1 := by omega
  have hb' : b = 0 ∨ b = 1 := by omega
  rcases ha' with rfl | rfl <;> rcases hb' with rfl | rfl <;> omega

theorem not_distinctGapRun_zero_three : ¬ DistinctGapRun 0 3 := by
  have h1 : primeGap 1 = 2 := by simp [primeGap]
  have h2 : primeGap 2 = 2 := by simp [primeGap]
  intro h
  have := h (show (1 : ℕ) ∈ Set.Ico 0 (0 + 3) by simp) (show (2 : ℕ) ∈ Set.Ico 0 (0 + 3) by simp)
    (h1.trans h2.symm)
  omega

theorem erdos_852.parts.ii :
    ∀ ε : ℝ, 0 < ε → ∀ᶠ x : ℝ in atTop, ∀ n : ℕ, (n : ℝ) < x → ∀ H : ℕ, DistinctGapRun n H → (H : ℝ) ≤ ε * Real.log x := by
  sorry

end Erdos852
