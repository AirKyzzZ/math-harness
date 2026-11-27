import Mathlib

open Asymptotics Filter

open scoped ArithmeticFunction.Omega

namespace Erdos205

def IsRepresentable (f : ℕ → ℝ) (n : ℕ) : Prop :=
  ∃ k m : ℕ, n = 2 ^ k + m ∧ (Ω m : ℝ) < f m

theorem erdos_205.variants.odd_counterexamples_neg :
    ¬ ({n : ℕ | Odd n ∧ ¬ IsRepresentable (fun m => Real.log (Real.log m)) n}.Infinite) := by
  sorry

end Erdos205
