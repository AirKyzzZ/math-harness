import Mathlib

open Nat Filter Finset Set

open scoped Topology

namespace Erdos1072

noncomputable def f (p : ℕ) : ℕ := sInf {n | (n)! + 1 ≡ 0 [MOD p]}

theorem erdos_1072.parts.i_neg :
    ¬ (Set.Infinite {p | p.Prime ∧ f p = p - 1}) := by
  sorry

end Erdos1072
