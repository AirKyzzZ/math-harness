import Mathlib

open Filter

namespace Erdos670

def HasSeparatedDistances {X : Type*} [MetricSpace X] (A : Finset X) : Prop :=
  ∀ a ∈ A, ∀ b ∈ A, ∀ c ∈ A, ∀ e ∈ A, a ≠ b → c ≠ e → s(a, b) ≠ s(c, e) →
    1 ≤ |dist a b - dist c e|

theorem erdos_670.variants.ho :
    ∀ ε > (0 : ℝ), ∃ᶠ n : ℕ in atTop, ∃ A : Finset (EuclideanSpace ℝ (Fin (n ^ 2 - n))), A.card = n ∧ HasSeparatedDistances A ∧ Metric.diam (A : Set (EuclideanSpace ℝ (Fin (n ^ 2 - n)))) ≤ (1 - 1 / Real.pi ^ 2 + ε) * (n : ℝ) ^ 2 := by
  sorry

end Erdos670
