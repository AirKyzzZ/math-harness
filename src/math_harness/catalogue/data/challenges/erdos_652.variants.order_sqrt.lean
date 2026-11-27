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

theorem erdos_652.variants.order_sqrt :
    ∃ c C : ℝ, 0 < c ∧ 0 < C ∧ ∀ᶠ k : ℕ in atTop, c * Real.sqrt k ≤ alpha k ∧ alpha k ≤ C * Real.sqrt k := by
  sorry

end Erdos652
