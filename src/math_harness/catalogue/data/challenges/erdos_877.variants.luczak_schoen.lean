import Mathlib

open Filter Asymptotics Real

namespace Erdos877

def IsMaximalSumFree (n : ℕ) (A : Finset ℕ) : Prop :=
  A ⊆ Finset.Icc 1 n ∧ IsSumFree (A : Set ℕ) ∧
    ∀ B ⊆ Finset.Icc 1 n, IsSumFree (B : Set ℕ) → A ⊆ B → A = B

open scoped Classical in
noncomputable def fm (n : ℕ) : ℕ :=
  ((Finset.Icc 1 n).powerset.filter fun A : Finset ℕ ↦ IsMaximalSumFree n A).card

theorem erdos_877.variants.luczak_schoen :
    ∃ c : ℝ, c < 1 / 2 ∧ ∀ᶠ n : ℕ in atTop, (fm n : ℝ) ≤ 2 ^ (c * n) := by
  sorry

end Erdos877
