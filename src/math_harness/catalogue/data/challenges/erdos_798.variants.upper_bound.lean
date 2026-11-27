import Mathlib

namespace Erdos798

open Filter Asymptotics

def gridPoints (n : ℕ) : Set (ℝ × ℝ) :=
  {p : ℝ × ℝ | ∃ i j : ℕ, 1 ≤ i ∧ i ≤ n ∧ 1 ≤ j ∧ j ≤ n ∧ p = ((i : ℝ), (j : ℝ))}

def IsLineCover (n : ℕ) (S : Set (ℝ × ℝ)) : Prop :=
  S ⊆ gridPoints n ∧
    ∀ x ∈ gridPoints n, ∃ p ∈ S, ∃ q ∈ S, p ≠ q ∧ Collinear ℝ ({p, q, x} : Set (ℝ × ℝ))

noncomputable def t (n : ℕ) : ℕ :=
  sInf {k | ∃ S : Set (ℝ × ℝ), IsLineCover n S ∧ S.ncard = k}

theorem erdos_798.variants.upper_bound :
    (fun n : ℕ => (t n : ℝ)) =O[atTop] (fun n : ℕ => (n : ℝ) ^ (2 / 3 : ℝ) * Real.log n) := by
  sorry

end Erdos798
