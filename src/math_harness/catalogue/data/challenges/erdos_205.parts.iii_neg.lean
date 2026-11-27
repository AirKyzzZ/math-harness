import Mathlib

open Asymptotics Filter

open scoped ArithmeticFunction.Omega

namespace Erdos205

def IsRepresentable (f : ℕ → ℝ) (n : ℕ) : Prop :=
  ∃ k m : ℕ, n = 2 ^ k + m ∧ (Ω m : ℝ) < f m

theorem erdos_205.parts.iii_neg :
    ¬ (¬ ∃ f : ℕ → ℝ, f =o[atTop] (fun m : ℕ => Real.log (Real.log m)) ∧ ∀ᶠ n : ℕ in atTop, IsRepresentable f n) := by
  sorry

end Erdos205
