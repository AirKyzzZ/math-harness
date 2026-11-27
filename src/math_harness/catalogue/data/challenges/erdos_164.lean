import Mathlib

namespace Erdos164

theorem erdos_164 :
    ∀ A : Set ℕ, (∀ a ∈ A, 2 ≤ a) → Erdos1196.IsPrimitive A → (∑' a : A, 1 / ((a : ℕ) * Real.log (a : ℕ))) ≤ ∑' p : {p : ℕ | p.Prime}, 1 / ((p : ℕ) * Real.log (p : ℕ)) := by
  sorry

end Erdos164
