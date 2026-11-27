import Mathlib

open Filter

namespace Erdos10

abbrev sumPrimeAndTwoPows (k : ℕ) : Set ℕ :=
  { p + (pows.map (2 ^ ·)).sum | (p : ℕ) (pows : Multiset ℕ) (_ : p.Prime)
    (_ : pows.card ≤ k)}

theorem two_mem_sumPrimeAndTwoPows_zero : 2 ∈ sumPrimeAndTwoPows 0 :=
  ⟨2, 0, Nat.prime_two, by simp, by simp⟩

theorem one_not_mem_sumPrimeAndTwoPows (k : ℕ) : 1 ∉ sumPrimeAndTwoPows k := by
  rintro ⟨p, pows, hp, -, h⟩
  have : 2 ≤ p := hp.two_le
  omega

theorem erdos_10.variants.two_pows :
    Set.Infinite <| {n : ℕ | Even n} \ sumPrimeAndTwoPows 2 := by
  sorry

end Erdos10
