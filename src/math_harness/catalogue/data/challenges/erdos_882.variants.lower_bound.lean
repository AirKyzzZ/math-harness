import Mathlib

open Finset

namespace Erdos882

def IsSubsetSumAntichain (A : Finset ℕ) : Prop :=
  ∀ S₁ ⊆ A, ∀ S₂ ⊆ A, S₁.Nonempty → S₂.Nonempty → S₁ ≠ S₂ →
    ¬ (∑ a ∈ S₁, a) ∣ (∑ a ∈ S₂, a)

noncomputable def maxAntichainCard (n : ℕ) : ℕ :=
  sSup {k | ∃ A ⊆ Finset.Icc 1 n, IsSubsetSumAntichain A ∧ A.card = k}

def A (m : ℕ) : Finset ℕ := (Finset.range m).image (fun i => 2 ^ m - 2 ^ i)

theorem A_subset_Icc (m : ℕ) : A m ⊆ Finset.Icc 1 (2 ^ m - 1) := by
  intro a ha
  simp only [A, Finset.mem_image, Finset.mem_range] at ha
  obtain ⟨i, hi, rfl⟩ := ha
  have h1 : 2 ^ i < 2 ^ m := Nat.pow_lt_pow_right (by norm_num) hi
  have h2 : 0 < 2 ^ i := by positivity
  rw [Finset.mem_Icc]
  omega

theorem card_A (m : ℕ) : (A m).card = m := by
  rw [A, Finset.card_image_of_injOn, Finset.card_range]
  intro i hi j hj hij
  have hi' : 2 ^ i < 2 ^ m :=
    Nat.pow_lt_pow_right (by norm_num) (Finset.mem_range.mp (Finset.mem_coe.mp hi))
  have hj' : 2 ^ j < 2 ^ m :=
    Nat.pow_lt_pow_right (by norm_num) (Finset.mem_range.mp (Finset.mem_coe.mp hj))
  have h : 2 ^ m - 2 ^ i = 2 ^ m - 2 ^ j := hij
  have h' : 2 ^ i = 2 ^ j := by omega
  exact Nat.pow_right_injective le_rfl h'

theorem erdos_882.variants.lower_bound (m : ℕ) :
    IsSubsetSumAntichain (A m) := by
  sorry

end Erdos882
