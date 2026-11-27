import Mathlib

namespace Erdos430

open Filter

def terms (n : ℕ) : Finset ℕ := (Finset.Ioo 1 n).filter fun m => ∀ p ∈ m.primeFactors, n - m < p

theorem terms_eight : terms 8 = {5, 7} := by
  decide +kernel

theorem isGreatest_sub_one {n : ℕ} (hn : 3 ≤ n) : IsGreatest (terms n : Set ℕ) (n - 1) := by
  refine ⟨?_, fun m hm => ?_⟩
  · simp only [terms, Finset.mem_coe, Finset.mem_filter, Finset.mem_Ioo]
    refine ⟨⟨by omega, by omega⟩, fun p hp => ?_⟩
    have := (Nat.prime_of_mem_primeFactors hp).one_lt
    omega
  · simp only [terms, Finset.mem_coe, Finset.mem_filter, Finset.mem_Ioo] at hm
    omega

theorem erdos_430_neg :
    ¬ (∀ᶠ n in atTop, ¬ ∀ m ∈ terms n, m.Prime) := by
  sorry

end Erdos430
