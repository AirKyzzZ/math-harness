import Mathlib

open ArithmeticFunction

open scoped omega Omega

namespace Erdos413

def IsBarrier (f : ℕ → ℝ) (n : ℕ) : Prop :=
  ∀ m < n, (m : ℝ) + f m ≤ n

def expProd (n : ℕ) : ℕ :=
  n.factorization.prod fun _ e => e

theorem erdos_413.parts.ii :
    (∃ ε > (0 : ℝ), { n | IsBarrier (fun n => ε * ω n) n }.Infinite) := by
  sorry

end Erdos413
