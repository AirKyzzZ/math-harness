import Mathlib

open Filter Real

open scoped Finset

namespace Erdos321

noncomputable def R (N : ℕ) : ℕ :=
  sSup { #A | (A) (_ : A ⊆ Finset.Icc 1 N)
      (_ : Set.InjOn (fun (S : Finset ℕ) ↦ ∑ n ∈ S, (1 : ℚ) / n) A.powerset) }

theorem erdos_321.variants.upper (N r : ℕ) (hr : 1 ≤ r) (hrN : ∀ i ≤ 2 * r, 1 ≤ log^[i] N) :
    R N ≤ 1 / log 2 * log^[r] N * N / log N * ∏ i ∈ Finset.Icc 3 r, (log^[i] N) := by
  sorry

end Erdos321
