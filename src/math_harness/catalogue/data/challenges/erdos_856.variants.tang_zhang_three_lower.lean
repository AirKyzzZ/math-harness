import Mathlib

open Filter Asymptotics

namespace Erdos856

def HasEqualLcmTuple (k : ℕ) (A : Finset ℕ) : Prop :=
  ∃ S : Finset ℕ, S ⊆ A ∧ S.card = k ∧ ∃ L : ℕ, ∀ a ∈ S, ∀ b ∈ S, a ≠ b → Nat.lcm a b = L

noncomputable def f (k N : ℕ) : ℝ :=
  sSup {s : ℝ | ∃ A : Finset ℕ, A ⊆ Finset.Icc 1 N ∧ ¬ HasEqualLcmTuple k A ∧
    s = ∑ n ∈ A, (n : ℝ)⁻¹}

theorem sum_le_f {k N : ℕ} {A : Finset ℕ} (hA : A ⊆ Finset.Icc 1 N)
    (hfree : ¬ HasEqualLcmTuple k A) : ∑ n ∈ A, (n : ℝ)⁻¹ ≤ f k N := by
  have hfin : {s : ℝ | ∃ A : Finset ℕ, A ⊆ Finset.Icc 1 N ∧ ¬ HasEqualLcmTuple k A ∧
      s = ∑ n ∈ A, (n : ℝ)⁻¹}.Finite := by
    refine ((Finset.Icc 1 N).powerset.finite_toSet.image
      (fun A : Finset ℕ => ∑ n ∈ A, (n : ℝ)⁻¹)).subset ?_
    rintro s ⟨B, hB, -, rfl⟩
    exact ⟨B, Finset.mem_coe.2 (Finset.mem_powerset.2 hB), rfl⟩
  exact le_csSup hfin.bddAbove ⟨A, hA, hfree, rfl⟩

theorem hasEqualLcmTuple_six_ten_fifteen : HasEqualLcmTuple 3 {6, 10, 15} :=
  ⟨{6, 10, 15}, Finset.Subset.refl _, by decide, 30, by decide⟩

noncomputable def tangZhangExponent (k : ℕ) : ℝ :=
  ((k : ℝ) - 2) / (Real.exp 1 * ((Nat.factorial (k - 2) : ℕ) : ℝ) ^ (1 / ((k : ℝ) - 2)))

theorem erdos_856.variants.tang_zhang_three_lower (ε : ℝ) (hε : 0 < ε) :
    ∀ᶠ N : ℕ in atTop, Real.log N ^ (Real.log 1.551 - ε) ≤ f 3 N := by
  sorry

end Erdos856
