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

theorem erdos_482.variants.stoll_explicit (g : ℕ) (hg : 2 ≤ g) (t : ℝ) (ht : 1 ≤ t) (htg : t < g) (ε : ℝ) (hεlo : -1 / (g : ℝ) ≤ ε) (hεhi : ε < ((g : ℝ) + 1) * ((g : ℝ) - 2) / g) :
    let a := (g : ℝ) / (((g : ℝ) - 1) * (t + g)) let b := ((g : ℝ) - 1) * (t + g) ∀ n : ℕ, generalRecurrence g a b ε (2 * n + 2) - (g : ℤ) * generalRecurrence g a b ε (2 * n) = ⌊t * (g : ℝ) ^ n⌋ - (g : ℤ) * ⌊t * (g : ℝ) ^ n / g⌋ := by
  sorry

end Erdos482
