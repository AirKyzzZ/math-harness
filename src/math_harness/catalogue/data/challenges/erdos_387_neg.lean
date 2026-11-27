import Mathlib

open Filter

namespace Erdos387

theorem erdos_387_neg :
    ¬ (¬ ∃ c : ℝ, 0 < c ∧ ∀ n k : ℕ, 1 ≤ k → k < n → ∃ d : ℕ, (d : ℝ) ∈ Set.Ioc (c * n) n ∧ d ∣ n.choose k) := by
  sorry

example : ∀ i < 15, ¬ 99215 - i ∣ Nat.choose 99215 15 :=
  fun i hi => by interval_cases i <;> native_decide

theorem erdos_387.variants.easy {n : ℕ} {k : ℕ} (hn : 1 ≤ n) (hk : k ≤ n) : ∃ d : ℕ,
    (d : ℝ) ∈ Set.Icc (n / k : ℝ) n ∧ d ∣ n.choose k := by
  by_cases k = 0 <;> simp_all
  refine ⟨(n.choose k).gcd n, ⟨?_, ?_⟩, gcd_dvd_left _ _⟩
  · rw [div_le_iff₀ (by positivity)]
    norm_cast
    rw [← Nat.gcd_mul_right]
    refine Nat.le_of_dvd ?_ (Nat.dvd_gcd ⟨(n - 1).choose (k - 1), ?_⟩ (dvd_mul_right _ _))
    · exact Nat.gcd_pos_of_pos_right _ (by positivity)
    · cases n <;> cases k <;> simp_all [Nat.add_one_mul_choose_eq]
  · exact Nat.le_of_dvd (by linarith) (gcd_dvd_right _ _)

end Erdos387
