import Mathlib

namespace Erdos663

open Filter Asymptotics

open scoped BigOperators

theorem erdos_663_neg :
    ¬ (∀ k ≥ 2, ∃ error : ℕ → ℝ, error =o[atTop] (fun _ ↦ (1 : ℝ)) ∧ ∀ᶠ n in atTop, let P : ℕ := ∏ i ∈ Finset.Icc 1 k, (n + i) ∃ q : ℕ, q.Prime ∧ ¬ q ∣ P ∧ (∀ p : ℕ, p.Prime → ¬ p ∣ P → q ≤ p) ∧ (q : ℝ) < (1 + error n) * Real.log n) := by
  sorry

-- TODO: Formalize the easy bound $q(n,k) < (1+o(1))k\log n$ recorded in the source.

end Erdos663
