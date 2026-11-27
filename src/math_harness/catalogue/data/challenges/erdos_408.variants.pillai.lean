import Mathlib

open Filter

open scoped Topology

namespace Erdos408

noncomputable def f (n : ℕ) : ℕ :=
  sInf {k : ℕ | 1 ≤ k ∧ Nat.totient^[k] n = 1}

theorem f_zero : f 0 = 0 := by
  rw [f, Nat.sInf_eq_zero]
  refine Or.inr (Set.eq_empty_iff_forall_notMem.2 fun k hk ↦ ?_)
  have h := hk.2
  rw [Function.iterate_fixed Nat.totient_zero] at h
  omega

theorem f_one : f 1 = 1 := by
  apply le_antisymm
  · exact Nat.sInf_le ⟨le_rfl, by simp⟩
  · exact le_csInf ⟨1, le_rfl, by simp⟩ fun _ hk ↦ hk.1

theorem f_two : f 2 = 1 := by
  apply le_antisymm
  · exact Nat.sInf_le ⟨le_rfl, by simp⟩
  · exact le_csInf ⟨1, le_rfl, by simp⟩ fun _ hk ↦ hk.1

theorem f_two_pow (k : ℕ) (hk : 1 ≤ k) : f (2 ^ k) = k := by
  have key : ∀ j, j ≤ k → Nat.totient^[j] (2 ^ k) = 2 ^ (k - j) := by
    intro j
    induction j with
    | zero => intro _; simp
    | succ j ih =>
      intro hj
      rw [Function.iterate_succ_apply', ih (by omega)]
      obtain ⟨i, hi⟩ : ∃ i, k - j = i + 1 := ⟨k - j - 1, by omega⟩
      rw [hi, Nat.totient_prime_pow_succ Nat.prime_two, show k - (j + 1) = i by omega]
      simp
  have hk1 : Nat.totient^[k] (2 ^ k) = 1 := by rw [key k le_rfl, Nat.sub_self, pow_zero]
  apply le_antisymm
  · exact Nat.sInf_le ⟨hk, hk1⟩
  refine le_csInf ⟨k, hk, hk1⟩ fun j hj ↦ ?_
  by_contra hlt
  have h2 : 2 ≤ 2 ^ (k - j) := Nat.le_self_pow (by omega) 2
  have h3 := hj.2
  rw [key j (by omega)] at h3
  omega

theorem erdos_408.variants.pillai (n : ℕ) (hn : 2 ≤ n) :
    ⌊(Real.log n - Real.log 2) / Real.log 3⌋₊ + 1 ≤ f n ∧ f n ≤ ⌊Real.log n / Real.log 2⌋₊ + 1 := by
  sorry

end Erdos408
