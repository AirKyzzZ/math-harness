import Mathlib

namespace Erdos731

noncomputable def leastNonDivisor (n : ℕ) : ℕ :=
  sInf {m : ℕ | 0 < m ∧ ¬ m ∣ n.centralBinom}

theorem leastNonDivisor_spec (n : ℕ) :
    0 < leastNonDivisor n ∧ ¬ leastNonDivisor n ∣ n.centralBinom := by
  have h : {m : ℕ | 0 < m ∧ ¬ m ∣ n.centralBinom}.Nonempty :=
    ⟨n.centralBinom + 1, by omega, Nat.not_dvd_of_pos_of_lt n.centralBinom_pos (by omega)⟩
  exact Nat.sInf_mem h

theorem leastNonDivisor_one : leastNonDivisor 1 = 3 := by
  have hc : (1 : ℕ).centralBinom = 2 := by decide +kernel
  have h3 : 3 ∈ {m : ℕ | 0 < m ∧ ¬ m ∣ (1 : ℕ).centralBinom} :=
    ⟨by norm_num, by rw [hc]; decide⟩
  unfold leastNonDivisor
  refine le_antisymm (Nat.sInf_le h3) (le_csInf ⟨3, h3⟩ fun m hm => ?_)
  obtain ⟨hm0, hm⟩ := hm
  rw [hc] at hm
  by_contra! hlt
  interval_cases m <;> simp at hm

theorem erdos_731.variants.egrs75 :
    ∀ ε > (0 : ℝ), {n : ℕ | Real.exp (Real.log n ^ ((1 : ℝ) / 2 - ε)) < (leastNonDivisor n : ℝ) ∧ (leastNonDivisor n : ℝ) < Real.exp (Real.log n ^ ((1 : ℝ) / 2 + ε))}.HasDensity 1 := by
  sorry

end Erdos731
