import Mathlib

namespace Erdos931

theorem erdos_931.variants.additional_condition :
    ∀ᵉ (k₁ : ℕ) (k₂ ≥ 3), k₂ ≤ k₁ → {(n₁, n₂) | n₁ + k₁ ≤ n₂ ∧ n₂ ≤ 2 * (n₁ + k₁) ∧ (∏ i ∈ Finset.Icc 1 k₁, (n₁ + i)).primeFactors = (∏ j ∈ Finset.Icc 1 k₂, (n₂ + j)).primeFactors}.Finite := by
  sorry

theorem erdos_931.variants.additional_condition_nonempty : ∃ (k₁ k₂ : ℕ), ∃ (_h₁ : k₂ ≤ k₁), ∃ (_h₂ : 3 ≤ k₂),
  {(n₁, n₂) | n₁ + k₁ ≤ n₂ ∧ n₂ ≤ 2 * (n₁ + k₁) ∧
      (∏ i ∈ Finset.Icc 1 k₁, (n₁ + i)).primeFactors =
      (∏ j ∈ Finset.Icc 1 k₂, (n₂ + j)).primeFactors}.Nonempty := by
  use 10, 3, (by norm_num), (by norm_num)
  use (0, 13)
  norm_num [Finset.prod_Icc_succ_top]
  norm_num +decide [Nat.primeFactors, Nat.primeFactorsList]

end Erdos931
