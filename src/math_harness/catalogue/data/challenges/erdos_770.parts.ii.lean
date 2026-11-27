import Mathlib

open Set ENat Filter

namespace Erdos770

noncomputable def h (n : ℕ) : ℕ∞ := sInf {m | 2 < m ∧
  ((Finset.Icc 2 m.toNat).image fun i => (i ^ n - 1)).gcd id = 1}

theorem erdos_770.parts.ii :
    liminf h atTop = ⊤ := by
  sorry

end Erdos770
