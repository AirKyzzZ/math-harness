import Mathlib

open scoped Polynomial

namespace Erdos324

theorem erdos_324_neg :
    ¬ (∃ f : ℤ[X], {(a, b) : ℕ × ℕ | a < b}.InjOn fun (a, b) => f.eval (a : ℤ) + f.eval (b : ℤ)) := by
  sorry

end Erdos324
