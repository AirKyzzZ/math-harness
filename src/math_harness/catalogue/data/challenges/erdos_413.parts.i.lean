import Mathlib

open ArithmeticFunction

open scoped omega Omega

namespace Erdos413

def IsBarrier (f : ℕ → ℝ) (n : ℕ) : Prop :=
  ∀ m < n, (m : ℝ) + f m ≤ n

theorem erdos_413.parts.i :
    { n | IsBarrier (fun m => ω m) n }.Infinite := by
  sorry

def expProd (n : ℕ) : ℕ :=
  n.factorization.prod fun _ e => e

end Erdos413
