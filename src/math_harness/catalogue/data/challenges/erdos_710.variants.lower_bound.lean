import Mathlib

open Filter Asymptotics

namespace Erdos710

noncomputable def f (n : ℕ) : ℕ :=
  sInf {L : ℕ | Erdos711.HasDivisibleDistinctTuple n n L}

theorem f_le {n L : ℕ} (h : Erdos711.HasDivisibleDistinctTuple n n L) : f n ≤ L :=
  Nat.sInf_le h

theorem hasDivisibleDistinctTuple_sq (n : ℕ) :
    Erdos711.HasDivisibleDistinctTuple n n (n ^ 2 + 1) := by
  refine ⟨fun i ↦ (i.val + 1) * (n + 1), fun i j hij ↦ ?_, fun i ↦ ⟨?_, ?_, ?_⟩⟩
  · have hij' : (i.val + 1) * (n + 1) = (j.val + 1) * (n + 1) := hij
    have := mul_right_cancel₀ (by omega : n + 1 ≠ 0) hij'
    exact Fin.ext (by omega)
  · show n < (i.val + 1) * (n + 1)
    nlinarith [Nat.zero_le (i.val * n)]
  · show (i.val + 1) * (n + 1) < n + (n ^ 2 + 1)
    have := Nat.mul_le_mul_right (n + 1) (show i.val + 1 ≤ n from i.isLt)
    nlinarith
  · exact dvd_mul_right _ _

theorem f_ten_le : f 10 ≤ 15 :=
  f_le ⟨![11, 22, 21, 16, 15, 12, 14, 24, 18, 20], by decide, by decide⟩

theorem erdos_710.variants.lower_bound :
    ∀ ε > (0 : ℝ), ∀ᶠ n : ℕ in atTop, (2 / Real.sqrt (Real.exp 1) - ε) * n * Real.sqrt (Real.log n / Real.log (Real.log n)) ≤ (f n : ℝ) := by
  sorry

end Erdos710
