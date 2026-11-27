import Mathlib

namespace Erdos458

def lcm_upto (n : ℕ) : ℕ :=
  (Finset.Icc 1 n).lcm id

theorem erdos_458 :
    ∀ k : ℕ, lcm_upto ((k + 1).nth Prime - 1) < k.nth Prime * lcm_upto (k.nth Prime) := by
  sorry

end Erdos458
