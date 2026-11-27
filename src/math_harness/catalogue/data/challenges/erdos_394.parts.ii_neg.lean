import Mathlib

open Nat Filter Finset

open scoped Asymptotics Topology Nat

namespace Erdos394

noncomputable def t (k n : ℕ) : ℕ :=
  sInf { m : ℕ | 0 < m ∧ n ∣ ∏ i ∈ range k, (m + i) }

theorem t_eq_of {n k v : ℕ} (hv : 0 < v)
    (hdvd : n ∣ ∏ i ∈ range k, (v + i))
    (hlt : ∀ m ∈ range v, 0 < m → ¬ (n ∣ ∏ i ∈ range k, (m + i))) :
    t k n = v := by
  refine le_antisymm (Nat.sInf_le ⟨hv, hdvd⟩) ?_
  by_contra! hc
  have hne : { m : ℕ | 0 < m ∧ n ∣ ∏ i ∈ range k, (m + i) }.Nonempty := ⟨v, hv, hdvd⟩
  obtain ⟨hpos, hd⟩ := Nat.sInf_mem hne
  exact hlt _ (mem_range.mpr hc) hpos hd

theorem t_one {n : ℕ} (hn : 0 < n) : t 1 n = n := by
  refine le_antisymm (Nat.sInf_le ⟨hn, by simp⟩) ?_
  have hne : { m : ℕ | 0 < m ∧ n ∣ ∏ i ∈ range 1, (m + i) }.Nonempty := ⟨n, hn, by simp⟩
  obtain ⟨hpos, hd⟩ := Nat.sInf_mem hne
  rw [prod_range_one, add_zero] at hd
  exact Nat.le_of_dvd hpos hd

theorem erdos_394.parts.ii_neg :
    ¬ (∀ k ≥ 2, (fun (x : ℝ) ↦ ∑ n ∈ Icc 1 ⌊x⌋₊, (t (k + 1) n : ℝ)) =o[atTop] (fun (x : ℝ) ↦ ∑ n ∈ Icc 1 ⌊x⌋₊, (t k n : ℝ))) := by
  sorry

set_option maxRecDepth 20000 in
theorem erdos_394.variants.factorial_gap_10 :
    ∀ (k : ℕ), 2 ≤ k → k < 10 →
    t k (10 !) <
    t (k - 1) (10 !) - 1 := by
  have h1 : t 1 (10 !) = 3628800 := by rw [t_one] <;> norm_num [Nat.factorial]
  have h2 : t 2 (10 !) = 512000 := by
    norm_num [Nat.factorial]; exact t_eq_of (by norm_num) (by native_decide) (by native_decide)
  have h3 : t 3 (10 !) = 6398 := by
    norm_num [Nat.factorial]; exact t_eq_of (by norm_num) (by native_decide) (by native_decide)
  have h4 : t 4 (10 !) = 5373 := by
    norm_num [Nat.factorial]; exact t_eq_of (by norm_num) (by native_decide) (by native_decide)
  have h5 : t 5 (10 !) = 348 := by
    norm_num [Nat.factorial]; exact t_eq_of (by norm_num) (by decide) (by decide)
  have h6 : t 6 (10 !) = 160 := by
    norm_num [Nat.factorial]; exact t_eq_of (by norm_num) (by decide) (by decide)
  have h7 : t 7 (10 !) = 30 := by
    norm_num [Nat.factorial]; exact t_eq_of (by norm_num) (by decide) (by decide)
  have h8 : t 8 (10 !) = 9 := by
    norm_num [Nat.factorial]; exact t_eq_of (by norm_num) (by decide) (by decide)
  have h9 : t 9 (10 !) = 2 := by
    norm_num [Nat.factorial]; exact t_eq_of (by norm_num) (by decide) (by decide)
  intro k hk2 hk10
  interval_cases k <;> simp_all

end Erdos394
