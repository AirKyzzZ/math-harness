import Mathlib

open scoped ArithmeticFunction.sigma

namespace Erdos825

theorem erdos_825_neg :
    ¬ (∃ (C : ℝ) (_ : C > 0), ∀ (n) (_ : σ 1 n > C * n), ∃ s ⊆ n.properDivisors, n = s.sum id) := by
  sorry

theorem erdos_825.variants.necessary_cond (C : ℝ) (_hC : 0 < C)
    (h : ∀ (n : ℕ) (_ : σ 1 n > C * n),
        ∃ s ⊆ n.properDivisors, n = s.sum id) :
    2 < C := by
  by_contra hle
  have hC2 : C ≤ 2 := not_lt.mp hle
  have hsig : σ 1 70 = 144 := by
    rw [ArithmeticFunction.sigma_one_apply]
    decide
  have hgt : σ 1 70 > C * (70 : ℕ) := by
    rw [hsig]
    push_cast
    linarith
  obtain ⟨s, hs, hsum⟩ := h 70 hgt
  have hall : ∀ t ∈ (Nat.properDivisors 70).powerset, t.sum id ≠ 70 := by decide +kernel
  exact hall s (Finset.mem_powerset.mpr hs) hsum.symm

end Erdos825
