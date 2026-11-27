import Mathlib

open Filter Real

open scoped Finset

namespace Erdos321

noncomputable def R (N : ℕ) : ℕ :=
  sSup { #A | (A) (_ : A ⊆ Finset.Icc 1 N)
      (_ : Set.InjOn (fun (S : Finset ℕ) ↦ ∑ n ∈ S, (1 : ℚ) / n) A.powerset) }

theorem erdos_321.variants.lower (N k : ℕ) (hk : 4 ≤ k) (hkN : k ≤ log^[k] N) :
    N / log N * ∏ i ∈ Finset.Icc 3 k, (log^[i] N) ≤ R N := by
  sorry

end Erdos321
