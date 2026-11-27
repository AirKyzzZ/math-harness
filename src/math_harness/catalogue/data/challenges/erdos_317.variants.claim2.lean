import Mathlib

namespace Erdos317

open Finset

open Filter

theorem erdos_317.variants.claim2 :
    ∀ᶠ n in atTop, ∀ δ : (Fin n) → ℚ, δ '' Set.univ ⊆ {-1,0,1} → letI lhs := |∑ k, ((δ k : ℚ) / (k + 1))| lhs ≠ 0 → lhs > 1 / (Icc 1 n).lcm id := by
  sorry

lemma claim2_inequality : ∀ᶠ n in atTop,
    ∀ δ : (Fin n) → ℚ, δ '' Set.univ ⊆ {-1,0,1} →
    letI lhs := |∑ k, ((δ k : ℚ) / (k + 1))|
    lhs ≠ 0 → lhs ≥ 1 / (Icc 1 n).lcm id := by
  -- This holds for every `n`: multiplying the sum by `L = lcm(1, ..., n)` gives an integer.
  refine Filter.Eventually.of_forall fun n δ hδ hne => ?_
  set L : ℕ := (Icc 1 n).lcm id with hL
  have hLpos : 0 < L := Nat.pos_of_ne_zero fun h0 => by
    simp [hL, Finset.lcm_eq_zero_iff] at h0
  have hLq : (0 : ℚ) < L := by exact_mod_cast hLpos
  have hterm : ∀ k : Fin n, ∃ z : ℤ, (L : ℚ) * (δ k / (k + 1)) = z := by
    intro k
    obtain ⟨m, hm⟩ : (k : ℕ) + 1 ∣ L :=
      Finset.dvd_lcm (f := id) (Finset.mem_Icc.mpr ⟨by omega, by omega⟩)
    have hk1 : ((k : ℕ) : ℚ) + 1 ≠ 0 := by positivity
    have hLm : (L : ℚ) = ((k : ℕ) + 1) * m := by exact_mod_cast hm
    rcases hδ ⟨k, trivial, rfl⟩ with h | h | h
    · exact ⟨-m, by rw [h, hLm]; push_cast; field_simp⟩
    · exact ⟨0, by rw [h]; simp⟩
    · exact ⟨m, by rw [h, hLm]; push_cast; field_simp⟩
  choose z hz using hterm
  have hsum : (L : ℚ) * ∑ k, δ k / (k + 1) = ((∑ k, z k : ℤ) : ℚ) := by
    rw [Finset.mul_sum, Int.cast_sum]
    exact Finset.sum_congr rfl fun k _ => hz k
  have hz0 : (∑ k, z k) ≠ 0 := by
    intro h0
    rw [h0, Int.cast_zero, mul_eq_zero] at hsum
    rcases hsum with h | h
    · exact hLq.ne' h
    · exact hne (by rw [h, abs_zero])
  have h1 : (1 : ℚ) ≤ |((∑ k, z k : ℤ) : ℚ)| := by exact_mod_cast Int.one_le_abs hz0
  rw [← hsum, abs_mul, abs_of_pos hLq] at h1
  rw [ge_iff_le, div_le_iff₀ hLq]
  linarith

theorem erdos_317.variants.counterexample : ¬ (∀  δ : (Fin 4) → ℚ, δ '' Set.univ ⊆ {-1,0,1} →
    letI lhs := |∑ k, ((δ k : ℚ) / (k + 1))|
    lhs ≠ 0 → lhs > (1 : ℚ) / ((Icc 1 4).lcm id : ℕ)) := by
  push Not
  use ![0, 1, -1, -1]
  norm_num [Finset.sum]
  exact ⟨by grind, by simp; rfl⟩

end Erdos317
