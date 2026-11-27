import Mathlib

namespace Erdos345

open IsAddComplete

def kthPowers (k : ℕ) : Set ℕ :=
  {x | ∃ n : ℕ, 0 < n ∧ n ^ k = x}

theorem erdos_345 :
    {k : ℕ | 0 < k ∧ ∃ a b : ℕ, IsLeast (thresholds (kthPowers k)) a ∧ IsLeast (thresholds (kthPowers (k + 1))) b ∧ b < a}.Infinite := by
  sorry

theorem isLeast_thresholds_one : IsLeast (thresholds (kthPowers 1)) 0 := by
  refine ⟨fun n _ ↦ ?_, fun m _ ↦ Nat.zero_le m⟩
  rcases Nat.eq_zero_or_pos n with rfl | hn
  · exact ⟨∅, by simp, by simp⟩
  · refine ⟨{n}, ?_, by simp⟩
    intro x hx
    simp only [Finset.coe_singleton, Set.mem_singleton_iff] at hx
    exact ⟨n, hn, by simp [hx]⟩

theorem threshold_one : threshold (kthPowers 1) = 0 :=
  threshold_eq_of_isLeast isLeast_thresholds_one

end Erdos345
