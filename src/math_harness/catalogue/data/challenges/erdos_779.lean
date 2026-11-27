import Mathlib

open Finset Nat

namespace Erdos779

-- TODO(firsching): add formalization of the known cases for this conjecture:

-- n ≤ 1000, as well as the conjecture that p ≤ n^O(1)

theorem erdos_779 (n : ℕ) (hn : n ≥ 1) :
    let P := ∏ i ∈ range (n + 1), nth Nat.Prime i ∃ p, p.Prime ∧ (P + p).Prime ∧ nth Nat.Prime n < p ∧ p < P := by
  sorry

end Erdos779
