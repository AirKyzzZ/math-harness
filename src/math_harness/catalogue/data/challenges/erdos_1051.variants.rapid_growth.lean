import Mathlib

namespace Erdos1051

def GrowthCondition (a : ℕ → ℤ) : Prop :=
  Filter.liminf (fun n => (((a n : ℝ) ^ (1 / 2 ^ n : ℝ) : ℝ) : EReal)) Filter.atTop > 1

noncomputable def ErdosSeries (a : ℕ → ℤ) : ℝ :=
  ∑' n : ℕ, 1 / ((a n : ℝ) * (a (n + 1) : ℝ))

theorem erdos_1051.variants.rapid_growth (a : ℕ → ℤ) (h_mono : StrictMono a) (h_rapid : ∃ C > 0, ∀ n, (a (n + 1) : ℝ) ≥ C * (a n : ℝ) ^ 2) :
    Irrational (ErdosSeries a) := by
  sorry

end Erdos1051
