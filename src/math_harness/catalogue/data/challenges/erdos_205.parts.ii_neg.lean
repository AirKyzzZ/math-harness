import Mathlib

open Asymptotics Filter

open scoped ArithmeticFunction.Omega

namespace Erdos205

def IsRepresentable (f : ℕ → ℝ) (n : ℕ) : Prop :=
  ∃ k m : ℕ, n = 2 ^ k + m ∧ (Ω m : ℝ) < f m

theorem erdos_205.parts.ii_neg :
    ¬ (¬ ∀ ε > (0 : ℝ), ∀ᶠ n : ℕ in atTop, IsRepresentable (fun m => ε * Real.log (Real.log m)) n) := by
  sorry

end Erdos205
