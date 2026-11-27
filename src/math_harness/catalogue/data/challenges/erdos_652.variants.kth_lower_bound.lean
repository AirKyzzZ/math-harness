import Mathlib

open Filter

open scoped EuclideanGeometry

namespace Erdos652

open scoped Classical in
def AdmissibleConstant (k : ℕ) (a : ℝ) : Prop :=
  0 < a ∧ ∀ᶠ n : ℕ in atTop, ∃ points : Finset ℝ²,
    points.card = n ∧
      k ≤ (points.filter fun point => (distinctDistancesFrom points point : ℝ) <
        a * Real.sqrt n).card

noncomputable def alpha (k : ℕ) : ℝ :=
  sInf {a | AdmissibleConstant k a}

theorem not_admissibleConstant_zero (k : ℕ) : ¬ AdmissibleConstant k 0 := by
  rintro ⟨ha, -⟩
  exact lt_irrefl _ ha

open scoped Classical in
theorem erdos_652.variants.kth_lower_bound :
    ∃ c : ℝ, 0 < c ∧ ∀ points : Finset ℝ², ∀ k : ℕ, 2 ≤ k → k ^ 3 ≤ points.card → (points.filter fun point => (distinctDistancesFrom points point : ℝ) < c * Real.sqrt ((k : ℝ) * points.card)).card < k := by
  sorry

end Erdos652
