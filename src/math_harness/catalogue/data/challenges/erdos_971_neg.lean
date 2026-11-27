import Mathlib

namespace Erdos971

open Filter Finset Real

noncomputable def leastCongruentPrime (a d : ℕ) : ℕ :=
  sInf {p : ℕ | p.Prime ∧ p ≡ a [MOD d]}

theorem erdos_971_neg :
    ¬ (∃ c > (0 : ℝ), ∃ C > (0 : ℝ), ∀ᶠ d in atTop, C * (d.totient : ℝ) ≤ #{a < d | a.Coprime d ∧ (leastCongruentPrime a d : ℝ) > (1 + c) * d.totient * log d}) := by
  sorry

end Erdos971
