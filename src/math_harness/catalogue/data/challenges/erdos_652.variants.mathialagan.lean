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
theorem erdos_652.variants.mathialagan :
    ∃ c : ℝ, 0 < c ∧ ∀ P Q : Finset ℝ², 2 ≤ P.card → P.card ^ 3 ≤ Q.card → ∃ p ∈ P, c * Real.sqrt ((P.card : ℝ) * Q.card) ≤ (Q.image fun q => dist p q).card := by
  sorry

end Erdos652
