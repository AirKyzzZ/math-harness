import Mathlib

namespace Erdos137

theorem erdos_137.variants.perfect_power (k : ℕ) (hk : k ≥ 2) (n : ℕ) (x l : ℕ) (hl : 2 ≤ l) :
    (∏ x ∈ Finset.Ioc n (n + k), x) ≠ x ^ l := by
  sorry

end Erdos137
