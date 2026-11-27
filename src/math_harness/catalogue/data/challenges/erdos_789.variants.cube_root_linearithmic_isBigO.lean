import Mathlib

open Filter

open scoped Asymptotics Finset

namespace Erdos789

def IsSubsetSumSeparatingCard (n m : ℕ) : Prop :=
  ∀ A : Finset ℤ, #A = n → ∃ B : Finset ℤ, B ⊆ A ∧ m ≤ #B ∧
    (∀ᵉ (T ⊆ B) (S ⊆ B), S.Nonempty → T.Nonempty → ∑ a ∈ T, a = ∑ b ∈ S, b → #T = #S)

noncomputable def subsetSumThreshold (n : ℕ): ℕ :=
  sSup { m | IsSubsetSumSeparatingCard n m }

theorem erdos_789.variants.cube_root_linearithmic_isBigO :
    (fun n : ℕ ↦ (n * Real.log n) ^ ((1 : ℝ) / 3)) =O[atTop] fun n ↦ (subsetSumThreshold n : ℝ) := by
  sorry

end Erdos789
