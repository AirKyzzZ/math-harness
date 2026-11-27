import Mathlib

open Nat

namespace Erdos939

def Erdos939Sums (r : ℕ) :=
    {S : Finset ℕ | S.card = r - 2 ∧ S.Coprime ∧ r.Full (∑ s ∈ S, s) ∧
      ∀ s ∈ S, 0 < s ∧ r.Full s}

theorem erdos_939.variants.triples :
    {(a,b,c) | ({a, b, c} : Finset ℕ).Coprime ∧ 0 < a ∧ 0 < b ∧ (3).Full a ∧ (3).Full b ∧ (3).Full c ∧ a + b = c}.Infinite := by
  sorry

theorem erdos_939.variants.examples : (∃ r ≥ 4, (Erdos939Sums r).Nonempty) := by
  use 5
  simp only [ge_iff_le, reduceLeDiff, true_and]
  unfold Erdos939Sums
  simp [Set.Nonempty]
  use {2^8 * 3^10 * 5^7, 2^12 * 23^6, 11^5 * 13^5}
  simp
  constructor
  · unfold Finset.Coprime
    aesop
  · norm_num [Nat.Full, Nat.primeFactors, Nat.primeFactorsList]

theorem erdos_939.variants.euler : ¬ (∀ k ≥ 4, ∀ S : Finset ℕ, S.card = k - 1 →
    (∀ s ∈ S, 0 < s) → ¬ (∃ q, ∑ s ∈ S, s ^ k = q ^k)) := by
  push Not
  use 5
  norm_num
  use {27, 84, 110, 133}
  refine ⟨by decide, by decide, 144, by norm_num⟩

end Erdos939
