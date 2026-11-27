import Mathlib

open ArithmeticFunction

open scoped omega Omega

namespace Erdos413

def IsBarrier (f : ℕ → ℝ) (n : ℕ) : Prop :=
  ∀ m < n, (m : ℝ) + f m ≤ n

def expProd (n : ℕ) : ℕ :=
  n.factorization.prod fun _ e => e

theorem erdos_413.variants.bigOmega_neg :
    ¬ ({ n | IsBarrier (fun m => Ω m) n }.Infinite) := by
  sorry

end Erdos413
