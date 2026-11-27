import Mathlib

open Filter

namespace Erdos895

theorem erdos_895.variants.eighteen (n : ℕ) (hn : 18 ≤ n) (G : SimpleGraph (Set.Icc 1 n)) (hG : G.CliqueFree 3) :
    ∃ a b c : Set.Icc 1 n, a ≠ b ∧ (a : ℕ) + (b : ℕ) = c ∧ G.IsIndepSet {a, b, c} := by
  sorry

end Erdos895
