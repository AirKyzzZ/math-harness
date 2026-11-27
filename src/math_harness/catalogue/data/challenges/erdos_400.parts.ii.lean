import Mathlib

open Nat Filter Finset

open scoped Asymptotics Topology

namespace Erdos400

noncomputable def g (k n : ℕ) : ℕ :=
  sSup { ((∑ i, a i) - n) | (a : Fin k → ℕ) (_ : (∏ i, (a i) !) ∣ n !) }

theorem erdos_400.parts.ii :
    ∀ᵉ (k ≥ 2), ∃ c : ℝ, ∀ ε > 0, Tendsto (fun x : ℕ ↦ (((Icc 1 x).filter (fun n ↦ |(g k n : ℝ) - c * Real.log x| ≤ ε * Real.log x)).card : ℝ) / x) atTop (𝓝 1) := by
  sorry

theorem erdos_400.variants.g_pos (k n : ℕ) (h: k ≥ 2) : 0 < g k n := by
  obtain ⟨k', rfl⟩ : ∃ k', k = k' + 2 := ⟨k - 2, by omega⟩
  simp only [g]
  -- Witness: a(0) = n, a(1) = 1, a(i) = 0 for i ≥ 2
  set a : Fin (k' + 2) → ℕ := fun i =>
    if (i : ℕ) = 0 then n else if (i : ℕ) = 1 then 1 else 0 with ha_def
  have h_prod : ∏ i : Fin (k' + 2), (a i)! = n ! := by
    rw [Fin.prod_univ_succ]; simp [ha_def]
    rw [Fin.prod_univ_succ]; simp
  have h_sum : ∑ i : Fin (k' + 2), a i = n + 1 := by
    rw [Fin.sum_univ_succ]; simp [ha_def]
  -- 1 is in the set
  have hmem : 1 ∈ {(∑ i, b i) - n | (b : Fin (k' + 2) → ℕ) (_ : ∏ i, (b i)! ∣ n !)} :=
    ⟨a, h_prod ▸ dvd_refl n !, by omega⟩
  -- The set is bounded above by (k'+2) * n!
  have hbdd : BddAbove {(∑ i, b i) - n | (b : Fin (k' + 2) → ℕ) (_ : ∏ i, (b i)! ∣ n !)} := by
    refine ⟨(k' + 2) * n !, ?_⟩
    rintro x ⟨b, hb, rfl⟩
    calc (∑ i, b i) - n
        ≤ ∑ i, b i := Nat.sub_le _ _
      _ ≤ ∑ i : Fin (k' + 2), (b i)! :=
          Finset.sum_le_sum fun i _ => Nat.self_le_factorial _
      _ ≤ Finset.univ.card • n ! := by
          apply Finset.sum_le_card_nsmul; intro i _
          exact le_trans (Finset.single_le_prod' (fun j _ =>
            Nat.one_le_iff_ne_zero.mpr (Nat.factorial_ne_zero _))
            (Finset.mem_univ i)) (Nat.le_of_dvd (Nat.factorial_pos n) hb)
      _ = (k' + 2) * n ! := by simp [smul_eq_mul]
  exact Nat.lt_of_lt_of_le Nat.one_pos (le_csSup hbdd hmem)

end Erdos400
