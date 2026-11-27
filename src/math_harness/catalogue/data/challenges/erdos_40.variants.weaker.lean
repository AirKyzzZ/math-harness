import Mathlib

open AdditiveCombinatorics Filter Real Set

open scoped Pointwise

namespace Erdos40

def Erdos40For (g : ℕ → ℝ) : Prop :=
  ∀ A : Set ℕ,
    (fun N : ℕ ↦ √N / g N) =O[atTop] (fun N ↦ ((A ∩ .Icc 1 N).ncard : ℝ)) →
    limsup (fun N ↦ (sumRep A N : ℕ∞)) atTop = ⊤

theorem erdos_40.variants.weaker :
    ∃ g : ℕ → ℝ, Tendsto g atTop atTop ∧ Erdos40For g := by
  sorry

theorem erdos_40.variants.implies_erdos_28 (g : ℕ → ℝ) (hg : Tendsto g atTop atTop)
    (h_erdos_40 : Erdos40For g) : type_of% Erdos28.erdos_28 := by
  classical
  intro A hA
  apply h_erdos_40 A
  obtain ⟨n, hn⟩ := hA.exists_le
  apply Asymptotics.IsBigO.of_bound 4
  filter_upwards [eventually_ge_atTop (2 * n + 2), hg.eventually_ge_atTop 1] with N hN hgN
  let k := (A ∩ Icc 1 N).ncard
  let B := insert 0 (A ∩ Icc 1 N)
  have hB : B.Finite := ((finite_Icc 1 N).inter_of_right A).insert 0
  have hmem : ∀ a ∈ A, a ≤ N → a ∈ B := by
    intro a ha haN
    by_cases ha0 : a = 0
    · exact Or.inl ha0
    · exact Or.inr ⟨ha, by omega, haN⟩
  have hsub : Icc (n + 1) N ⊆ B + B := by
    intro m ⟨hmlo, hmhi⟩
    have hmA : m ∈ A + A := by
      by_contra hmA
      have := hn m hmA
      omega
    obtain ⟨a, ha, b, hb, hab⟩ := hmA
    simp only at hab
    exact ⟨a, hmem a ha (by omega), b, hmem b hb (by omega), hab⟩
  have hcard : N - n ≤ (k + 1) ^ 2 := calc
    N - n = (Icc (n + 1) N).ncard := by simp
    _ ≤ (B + B).ncard := ncard_le_ncard hsub (hB.add hB)
    _ ≤ B.ncard ^ 2 := by
      simpa only [Nat.card_coe_set_eq, pow_two] using (Set.natCard_add_le (s := B) (t := B))
    _ ≤ (k + 1) ^ 2 := by
      gcongr
      exact ncard_insert_le 0 (A ∩ Icc 1 N)
  have hcard' : N ≤ n + (k + 1) ^ 2 := by omega
  have hk : 1 ≤ k := by nlinarith
  have hcardR : (N : ℝ) ≤ n + ((k : ℝ) + 1) ^ 2 := by exact_mod_cast hcard'
  have hNR : 2 * (n : ℝ) + 2 ≤ (N : ℝ) := by exact_mod_cast hN
  have hkR : 1 ≤ (k : ℝ) := by exact_mod_cast hk
  have hsqrt : √(N : ℝ) ≤ 4 * (k : ℝ) := by
    apply sqrt_le_iff.2
    constructor
    · positivity
    · nlinarith [sq_nonneg ((k : ℝ) - 1)]
  rw [Real.norm_of_nonneg (div_nonneg (sqrt_nonneg _) (le_trans zero_le_one hgN)),
    Real.norm_natCast]
  exact (div_le_self (sqrt_nonneg _) hgN).trans hsqrt

end Erdos40
