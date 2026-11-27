import Mathlib

open Filter SimpleGraph

open scoped EuclideanGeometry Topology

namespace Erdos1070

noncomputable def f (n : ℕ) : ℕ :=
  sSup {m : ℕ | ∀ X : Finset ℝ², X.card = n →
    m ≤ (UnitDistancePlaneGraph (X : Set ℝ²)).indepNum}

theorem f_le (X : Finset ℝ²) :
    f X.card ≤ (UnitDistancePlaneGraph (X : Set ℝ²)).indepNum := by
  refine csSup_le ⟨0, fun _ _ => Nat.zero_le _⟩ ?_
  intro m hm
  exact hm X rfl

theorem erdos_1070.parts.ii :
    ¬ ∀ n : ℕ, (n : ℝ) / 4 ≤ (f n : ℝ) := by
  sorry

end Erdos1070
