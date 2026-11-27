import Mathlib

open Filter Real

open scoped Nat Topology

namespace Erdos1063

noncomputable def n (k : ℕ) : ℕ :=
  sInf {m | 2 * k ≤ m ∧ ∃ i0 < k, ¬ (m - i0) ∣ m.choose k ∧
    ∀ i < k, i ≠ i0 → (m - i) ∣ m.choose k}

theorem erdos_1063.variants.small_values :
    n 2 = 4 ∧ n 3 = 6 ∧ n 4 = 9 ∧ n 5 = 12 := by
  refine ⟨?_, ?_, ?_, ?_⟩
  · -- n 2 = 4 : every element of the set is ≥ 2 * 2 = 4, and 4 itself lies in the set
    apply le_antisymm
    · exact Nat.sInf_le (by decide)
    · apply le_csInf ⟨4, by decide⟩
      rintro b hb
      have : 2 * 2 ≤ b := hb.1
      omega
  · -- n 3 = 6
    apply le_antisymm
    · exact Nat.sInf_le (by decide)
    · apply le_csInf ⟨6, by decide⟩
      rintro b hb
      have : 2 * 3 ≤ b := hb.1
      omega
  · -- n 4 = 9 : the only candidate below 9 is m = 8, where both 8 and 6 fail to divide C(8,4) = 70
    apply le_antisymm
    · exact Nat.sInf_le (by decide)
    · apply le_csInf ⟨9, by decide⟩
      rintro b hb
      have hb8 : 8 ≤ b := by have := hb.1; omega
      by_contra! h
      interval_cases b
      · exact absurd hb (by decide)
  · -- n 5 = 12 : the candidates below 12 are m = 10, 11, both of which fail
    apply le_antisymm
    · exact Nat.sInf_le (by decide)
    · apply le_csInf ⟨12, by decide⟩
      rintro b hb
      have hb10 : 10 ≤ b := by have := hb.1; omega
      by_contra! h
      interval_cases b
      · exact absurd hb (by decide)
      · exact absurd hb (by decide)

theorem erdos_1063.variants.exp_upper_bound :
    ∃ f : ℕ → ℝ, Tendsto f atTop (𝓝 0) ∧ ∀ k, (n k : ℝ) ≤ exp ((1 + f k) * k) := by
  sorry

end Erdos1063
