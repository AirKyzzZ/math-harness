import Mathlib

namespace Erdos427

def erdos427 : Prop := ∀ (n d : ℕ),
    -- Need to allow `n = 0` since we're counting primes from `0` rather than `1`
    -- `d` needs to be `≠ 0` since the sum is never `0`!
    d ≠ 0 → ∃ k, k ≠ 0 ∧
    d ∣ ∑ i ∈ Finset.Ico n (n + k), i.nth Nat.Prime

def ShiuTheorem : Prop := ∀ (k a q : ℕ), 1 ≤ k → 1 ≤ q → a.gcd q = 1 →
    { m : ℕ | ∀ p ∈ (Finset.Ico m (m + k)).image (Nat.nth Nat.Prime), p ≡ a [MOD q]}.Infinite

theorem erdos_427_neg :
    ¬ (erdos427) := by
  sorry

theorem erdos_427.variants.of_shiu (H : ShiuTheorem) : erdos427 := by
  intro n d hd
  obtain ⟨m, hm, hnm⟩ := (H d 1 d (by omega) (by omega) (by simp)).exists_gt n
  have hp : ∀ i < d, (m + i).nth Nat.Prime ≡ 1 [MOD d] := fun i hi =>
    hm _ (Finset.mem_image.2 ⟨m + i, Finset.mem_Ico.2 ⟨by omega, by omega⟩, rfl⟩)
  set S := ∑ i ∈ Finset.Ico n m, i.nth Nat.Prime
  set j := d - S % d with hj
  have hS := Nat.mod_lt S (by omega : 0 < d)
  refine ⟨m - n + j, by omega, ?_⟩
  have hsplit : ∑ i ∈ Finset.Ico n (n + (m - n + j)), i.nth Nat.Prime =
      S + ∑ i ∈ Finset.range j, (m + i).nth Nat.Prime := by
    rw [show n + (m - n + j) = m + j by omega,
      ← Finset.sum_Ico_consecutive _ hnm.le (by omega : m ≤ m + j)]
    congr 1
    rw [Finset.sum_Ico_eq_sum_range, show m + j - m = j by omega]
  have hmod : ∑ i ∈ Finset.range j, (m + i).nth Nat.Prime ≡ j [MOD d] := by
    calc ∑ i ∈ Finset.range j, (m + i).nth Nat.Prime
        ≡ ∑ i ∈ Finset.range j, 1 [MOD d] :=
          Nat.ModEq.sum fun i hi => hp i (by have := Finset.mem_range.1 hi; omega)
      _ = j := by simp
  rw [hsplit, Nat.dvd_iff_mod_eq_zero, Nat.add_mod, hmod]
  rcases Nat.eq_zero_or_pos (S % d) with h | h
  · rw [hj, h, Nat.sub_zero, Nat.mod_self]
    simp
  · rw [Nat.mod_eq_of_lt (by omega : j < d), hj, show S % d + (d - S % d) = d by omega,
      Nat.mod_self]

end Erdos427
