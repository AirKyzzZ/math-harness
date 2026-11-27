import Mathlib

namespace Erdos1020

noncomputable def f (n r k : ℕ) : ℕ :=
  Hypergraph.extremalNumber n r fun H ↦ ¬ H.HasHypergraphMatching k

theorem erdos_1020 (r : ℕ) (hr : 3 ≤ r) (n k : ℕ) (hk : 0 < k) (hrk : r * k - 1 ≤ n) :
    f n r k = max ((r * k - 1).choose r) (n.choose r - (n - k + 1).choose r) := by
  sorry

end Erdos1020
