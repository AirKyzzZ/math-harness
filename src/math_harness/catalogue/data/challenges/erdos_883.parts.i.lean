import Mathlib

open Filter

namespace Erdos883

def coprimeGraph : SimpleGraph ℕ :=
  SimpleGraph.fromRel Nat.Coprime

theorem erdos_883.parts.i :
    ∀ (n : ℕ) (A : Finset ℕ), A ⊆ Finset.Icc 1 n → n / 2 + n / 3 - n / 6 < A.card → ∀ l : ℕ, Odd l → 3 ≤ l → l ≤ n / 3 + 1 → l ∈ (coprimeGraph.induce (A : Set ℕ)).oddCycleLengths := by
  sorry

end Erdos883
