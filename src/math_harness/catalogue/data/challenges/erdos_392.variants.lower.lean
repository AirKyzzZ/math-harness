import Mathlib

open Filter

open scoped Nat

namespace Erdos392

theorem erdos_392.variants.lower (A : ℕ → ℕ) (hA : ∀ n > 0, IsLeast { t + 1 | (t) (_ : ∃ a : Fin (t + 1) → ℕ, (n)! = ∏ i, a i ∧ Monotone a ∧ a (Fin.last t) ≤ n) } (A n)) :
    (fun (n : ℕ) => (A n - n + n / Real.log n : ℝ)) =o[atTop] fun n => n / Real.log n := by
  sorry

end Erdos392
