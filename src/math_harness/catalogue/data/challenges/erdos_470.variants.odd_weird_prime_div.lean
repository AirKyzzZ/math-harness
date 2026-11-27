import Mathlib

namespace Erdos470

def PrimitiveWeird (n : ℕ) := n.Weird ∧ ∀ d ∈ n.properDivisors, ¬d.Weird

def AbundancyIndex (n : ℕ) : ℚ := (∑ d ∈ n.divisors, d) / n

theorem erdos_470.variants.smallest_weird_eq_70 : (∀ n < 70, ¬n.Weird) ∧ (70).Weird := by
  refine ⟨?_, Nat.weird_seventy⟩
  rintro n hn ⟨ha, hnp⟩
  unfold Nat.Abundant at ha
  apply hnp
  -- For non-abundant `n`, `ha` is contradictory; for each abundant `n < 70`, exhibit an explicit
  -- subset of its proper divisors summing to `n` (so `n` is pseudoperfect, hence not weird).
  interval_cases n <;>
    first
    | exact absurd ha (by decide)
    | exact ⟨by decide, ({2, 4, 6} : Finset ℕ), by decide, by decide⟩
    | exact ⟨by decide, ({3, 6, 9} : Finset ℕ), by decide, by decide⟩
    | exact ⟨by decide, ({1, 4, 5, 10} : Finset ℕ), by decide, by decide⟩
    | exact ⟨by decide, ({4, 8, 12} : Finset ℕ), by decide, by decide⟩
    | exact ⟨by decide, ({5, 10, 15} : Finset ℕ), by decide, by decide⟩
    | exact ⟨by decide, ({6, 12, 18} : Finset ℕ), by decide, by decide⟩
    | exact ⟨by decide, ({2, 8, 10, 20} : Finset ℕ), by decide, by decide⟩
    | exact ⟨by decide, ({7, 14, 21} : Finset ℕ), by decide, by decide⟩
    | exact ⟨by decide, ({8, 16, 24} : Finset ℕ), by decide, by decide⟩
    | exact ⟨by decide, ({9, 18, 27} : Finset ℕ), by decide, by decide⟩
    | exact ⟨by decide, ({2, 4, 8, 14, 28} : Finset ℕ), by decide, by decide⟩
    | exact ⟨by decide, ({10, 20, 30} : Finset ℕ), by decide, by decide⟩
    | exact ⟨by decide, ({11, 22, 33} : Finset ℕ), by decide, by decide⟩

theorem erdos_470.variants.odd_weird_prime_div :
    ∀ n : ℕ, Odd n → n.Weird → 6 ≤ {m | m ∈ n.divisors ∧ m.Prime}.ncard := by
  sorry

end Erdos470
