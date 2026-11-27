import Mathlib

open Real Filter

namespace Erdos688

def Erdos688Prop (n : ℕ) (ε : ℝ) : Prop :=
  ∃ (a : ℕ → ℕ), ∀ (m : ℕ), 1 ≤ m → m ≤ n →
    ∃ (p : ℕ), p.Prime ∧ (n : ℝ)^ε < p ∧ p ≤ n ∧
      a p ≡ m [MOD p]

noncomputable def epsilonFunction (n : ℕ) : ℝ := sSup {ε : ℝ | Erdos688Prop n ε}

theorem erdos_688.variants.lglglg_over_lglg_is_big_o :
    (fun (n : ℕ) ↦ (log (log (log (n : ℝ)))) / (log (log (n : ℝ)))) =O[atTop] epsilonFunction := by
  sorry

end Erdos688
