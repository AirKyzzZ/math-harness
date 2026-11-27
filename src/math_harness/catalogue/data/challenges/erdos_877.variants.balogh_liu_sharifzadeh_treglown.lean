import Mathlib

open Filter Asymptotics Real

namespace Erdos877

def IsMaximalSumFree (n : ℕ) (A : Finset ℕ) : Prop :=
  A ⊆ Finset.Icc 1 n ∧ IsSumFree (A : Set ℕ) ∧
    ∀ B ⊆ Finset.Icc 1 n, IsSumFree (B : Set ℕ) → A ⊆ B → A = B

open scoped Classical in
noncomputable def fm (n : ℕ) : ℕ :=
  ((Finset.Icc 1 n).powerset.filter fun A : Finset ℕ ↦ IsMaximalSumFree n A).card

theorem erdos_877.variants.balogh_liu_sharifzadeh_treglown :
    Tendsto (fun n : ℕ ↦ logb 2 (fm n) / n) atTop (nhds (1 / 4)) := by
  sorry

end Erdos877
