import Mathlib

namespace Erdos403

theorem erdos_403 :
    {p : ℕ × Finset ℕ | (∀ a ∈ p.2, 0 < a) ∧ 2 ^ p.1 = ∑ a ∈ p.2, a.factorial}.Finite := by
  sorry

end Erdos403
