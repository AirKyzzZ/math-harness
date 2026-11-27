import Mathlib

open Set ENat Filter

namespace Erdos770

noncomputable def h (n : ℕ) : ℕ∞ := sInf {m | 2 < m ∧
  ((Finset.Icc 2 m.toNat).image fun i => (i ^ n - 1)).gcd id = 1}

theorem erdos_770.parts.iii :
    ∀ ε > 0, ∀ᶠ n in atTop, let p := sSup {m : ℕ | m.Prime ∧ m - 1 ∣ n} p > (n : ℝ) ^ (ε : ℝ) → h n = p := by
  sorry

end Erdos770
