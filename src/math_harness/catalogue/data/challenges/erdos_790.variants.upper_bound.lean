import Mathlib

open Filter

open scoped Asymptotics

namespace Erdos790

def DistinctSubsetSumFree (B : Finset ℤ) : Prop :=
  ∀ a ∈ B, ∀ S : Finset ℤ,
    S ⊆ B.erase a → 2 ≤ S.card → (∑ x ∈ S, x) ≠ a

def Guarantees (n k : ℕ) : Prop :=
  ∀ A : Finset ℤ, A.card = n →
    ∃ B ⊆ A, DistinctSubsetSumFree B ∧ k ≤ B.card

noncomputable def l (n : ℕ) : ℕ := by
  classical
  exact Nat.findGreatest (Guarantees n) n

theorem erdos_790.variants.upper_bound :
    (fun n ↦ (l n : ℝ)) =O[atTop] (fun n : ℕ ↦ (n : ℝ) / Real.log n) := by
  sorry

end Erdos790
