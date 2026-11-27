import Mathlib

open Filter

open scoped Asymptotics Nat.Prime

namespace Erdos950

noncomputable def f (n : ℕ) : ℝ :=
  ∑ p ∈ (Finset.range n).filter Prime, (1 : ℝ) / (n - p : ℝ)

theorem erdos_950.variants.weaker_pi_implies_f (h : ∃ C > (0 : ℝ), ∃ K > (0 : ℝ), ∀ᶠ x : ℕ in atTop, ∀ y : ℕ, (y : ℝ) < x - (Real.log x) ^ C → (π x : ℝ) < (π y : ℝ) + K * ((x - y : ℝ) / Real.log x)) :
    f =O[atTop] fun n : ℕ ↦ Real.log (Real.log (Real.log n)) := by
  sorry

end Erdos950
