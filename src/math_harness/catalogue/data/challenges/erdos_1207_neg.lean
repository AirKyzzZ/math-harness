import Mathlib

open Filter

open scoped EuclideanGeometry

namespace Erdos1207

noncomputable def P (d n : ℕ) : ℕ :=
  sInf {m : ℕ | ∃ S : Finset (ℝ^d), S.card = n ∧
    m = sSup {k : ℕ | ∃ A ⊆ S, (A : Set (ℝ^d)).IsIsoscelesFree ∧ A.card = k}}

theorem erdos_1207_neg :
    ¬ (∃ c > (0 : ℝ), ∀ᶠ n : ℕ in atTop, (P 2 n : ℝ) < (n : ℝ) ^ (1 - c)) := by
  sorry

end Erdos1207
