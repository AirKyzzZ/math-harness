import Mathlib

open Asymptotics Filter

open scoped ArithmeticFunction.Omega

namespace Erdos205

def IsRepresentable (f : ℕ → ℝ) (n : ℕ) : Prop :=
  ∃ k m : ℕ, n = 2 ^ k + m ∧ (Ω m : ℝ) < f m

theorem erdos_205.variants.many_prime_factors :
    ∃ c > (0 : ℝ), {n : ℕ | ∀ k : ℕ, 2 ^ k < n → c * Real.sqrt (Real.log n / Real.log (Real.log n)) ≤ (Ω (n - 2 ^ k) : ℝ)}.Infinite := by
  sorry

end Erdos205
