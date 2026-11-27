import Mathlib

open Filter

open scoped Topology

namespace Erdos1005

def IsFarey (n : ℕ) (q : ℚ) : Prop :=
  0 ≤ q ∧ q ≤ 1 ∧ q.den ≤ n

noncomputable def betweenCount (n : ℕ) (x y : ℚ) : ℕ :=
  {q : ℚ | IsFarey n q ∧ x < q ∧ q < y}.ncard

noncomputable def f (n : ℕ) : ℕ :=
  sInf {k | ∃ x y : ℚ, IsFarey n x ∧ IsFarey n y ∧ x < y ∧
    (x.num - y.num) * ((x.den : ℤ) - y.den) < 0 ∧ betweenCount n x y = k}

theorem erdos_1005.variants.constant :
    Tendsto (fun n : ℕ => (f n : ℝ) / n) atTop (𝓝 (1 / 4)) := by
  sorry

end Erdos1005
