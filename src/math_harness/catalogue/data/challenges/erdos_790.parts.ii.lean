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

theorem erdos_790.parts.ii :
    Tendsto (fun n : ℕ ↦ (l n : ℝ) / Real.sqrt (n : ℝ)) atTop atTop := by
  sorry

end Erdos790
