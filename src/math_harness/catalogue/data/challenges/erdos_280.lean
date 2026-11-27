import Mathlib

namespace Erdos280

open Filter

def isCoveredBy (n a : ℕ → ℕ) (m k : ℕ) : Prop :=
  ∃ i ∈ Finset.Icc 1 k, m % n i = a i

noncomputable def uncoveredCount (n a : ℕ → ℕ) (k : ℕ) : ℕ := by
  classical
  exact ((Finset.range (n k)).filter (fun m => ¬ isCoveredBy n a m k)).card

theorem erdos_280 :
    ¬ ∀ (n a : ℕ → ℕ), StrictMono n → (∀ i, 1 ≤ i → a i < n i) → (∃ ε : ℝ, 0 < ε ∧ ∀ k, 1 ≤ k → (n k : ℝ) > (1 + ε) * (k : ℝ) * Real.log (k : ℝ)) → ¬ Tendsto (fun k : ℕ => (uncoveredCount n a k : ℝ) / (k : ℝ)) atTop (nhds 0) := by
  sorry

end Erdos280
