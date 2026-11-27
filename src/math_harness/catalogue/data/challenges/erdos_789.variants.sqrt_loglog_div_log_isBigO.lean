import Mathlib

open Filter

open scoped Asymptotics Finset

namespace Erdos789

def IsSubsetSumSeparatingCard (n m : ℕ) : Prop :=
  ∀ A : Finset ℤ, #A = n → ∃ B : Finset ℤ, B ⊆ A ∧ m ≤ #B ∧
    (∀ᵉ (T ⊆ B) (S ⊆ B), S.Nonempty → T.Nonempty → ∑ a ∈ T, a = ∑ b ∈ S, b → #T = #S)

noncomputable def subsetSumThreshold (n : ℕ): ℕ :=
  sSup { m | IsSubsetSumSeparatingCard n m }

theorem erdos_789.variants.sqrt_loglog_div_log_isBigO :
    (fun n : ℕ ↦ √(n * Real.log (Real.log n) / Real.log n)) =O[atTop] fun n ↦ (subsetSumThreshold n : ℝ) := by
  sorry

end Erdos789
