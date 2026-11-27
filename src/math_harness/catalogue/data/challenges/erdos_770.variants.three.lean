import Mathlib

open Set ENat Filter

namespace Erdos770

noncomputable def h (n : ℕ) : ℕ∞ := sInf {m | 2 < m ∧
  ((Finset.Icc 2 m.toNat).image fun i => (i ^ n - 1)).gcd id = 1}

theorem erdos_770.variants.three :
    {n | h n = 3}.Infinite := by
  sorry

end Erdos770
