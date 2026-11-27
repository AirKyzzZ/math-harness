import Mathlib

open Filter

open scoped Asymptotics Nat.Prime

namespace Erdos950

noncomputable def f (n : ℕ) : ℝ :=
  ∑ p ∈ (Finset.range n).filter Prime, (1 : ℝ) / (n - p : ℝ)

theorem erdos_950.variants.weaker_pi_neg :
    ¬ (∀ ε > 0, ∀ᶠ x in atTop, ∃ y < x, (π x : ℝ) < (π y : ℝ) + ε * (π (x - y) : ℝ)) := by
  sorry

end Erdos950
