import Mathlib

open Filter Asymptotics Finset

namespace Erdos272

def IsArithInterSet (N : ℕ) (A : Finset (Finset ℕ)) : Prop :=
  A ⊆ (Finset.Icc 1 N).powerset ∧
    (SetLike.coe A).Pairwise fun S T ↦ ∃ l > 0, (SetLike.coe (S ∩ T)).IsAPOfLength l

noncomputable def maxArithInterCard (N : ℕ) : ℕ :=
  sSup {#A | (A : _) (_ : IsArithInterSet N A)}

theorem erdos_272.variants.szabo :
    (fun N ↦ (maxArithInterCard N - N ^ 2 / 2 : ℝ)) =O[atTop] fun N : ℕ ↦ N ^ ((5 : ℝ) / 3) * (Real.log N) ^ 3 := by
  sorry

end Erdos272
