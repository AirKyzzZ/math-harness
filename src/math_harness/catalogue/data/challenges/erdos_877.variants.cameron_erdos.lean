import Mathlib

open Filter Asymptotics Real

namespace Erdos877

def IsMaximalSumFree (n : ℕ) (A : Finset ℕ) : Prop :=
  A ⊆ Finset.Icc 1 n ∧ IsSumFree (A : Set ℕ) ∧
    ∀ B ⊆ Finset.Icc 1 n, IsSumFree (B : Set ℕ) → A ⊆ B → A = B

open scoped Classical in
noncomputable def fm (n : ℕ) : ℕ :=
  ((Finset.Icc 1 n).powerset.filter fun A : Finset ℕ ↦ IsMaximalSumFree n A).card

theorem erdos_877.variants.cameron_erdos :
    ∀ᶠ n : ℕ in atTop, (2 : ℝ) ^ ((n : ℝ) / 4) < fm n := by
  sorry

end Erdos877
