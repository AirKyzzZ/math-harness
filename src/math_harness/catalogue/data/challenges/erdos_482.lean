import Mathlib

namespace Erdos482

noncomputable def a : ℕ → ℕ
  | 0 => 0
  | 1 => 1
  | n + 2 => ⌊√2 * ((a (n + 1) : ℝ) + 1 / 2)⌋₊

noncomputable def generalRecurrence (g : ℕ) (a b ε : ℝ) : ℕ → ℤ
  | 0 => 1
  | n + 1 =>
      if Even n then ⌊a * ((generalRecurrence g a b ε n : ℝ) + ε)⌋
      else ⌊b * ((generalRecurrence g a b ε n : ℝ) + 1 / ((g : ℝ) - 1))⌋

theorem erdos_482 :
    (∀ n : ℕ, 1 ≤ n → (a (2 * n + 1) : ℤ) - 2 * a (2 * n - 1) = (Real.digits (√2 / 2) 2 (n - 1) : ℕ)) ∧ Real.ofDigits (Real.digits (√2 / 2) 2) = √2 / 2 := by
  sorry

noncomputable def alpha (t : ℝ) : ℝ := 2 * (t + 1) / (t + 2)

noncomputable def beta (t : ℝ) : ℝ := (t + 2) / (t + 1)

noncomputable def stollBinary (t : ℝ) : ℕ → ℕ
  | 0 => 1
  | n + 1 =>
      ⌊(if Even n then alpha t else beta t) * ((stollBinary t n : ℝ) + 1 / 2)⌋₊

noncomputable def binaryDigit (t : ℝ) : ℕ → Fin 2
  | 0 => 0
  | 1 => 1
  | k + 2 => Real.digits (t - 1) 2 k

end Erdos482
