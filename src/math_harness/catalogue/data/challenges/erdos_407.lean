import Mathlib

namespace Erdos407

noncomputable def w (n : ℕ) : ℕ :=
  {x : ℕ × ℕ × ℕ × ℕ | 2 ^ x.1 + 3 ^ x.2.1 + 2 ^ x.2.2.1 * 3 ^ x.2.2.2 = n}.ncard

theorem erdos_407 :
    ∃ C : ℕ, ∀ n : ℕ, w n ≤ C := by
  sorry

end Erdos407
