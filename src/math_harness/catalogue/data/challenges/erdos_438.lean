import Mathlib

open Filter

open scoped Topology

namespace Erdos438

def SquareSumFree (A : Finset ℕ) : Prop :=
  ∀ a ∈ A, ∀ b ∈ A, ¬ IsSquare (a + b)

noncomputable def extremalSize (N : ℕ) : ℕ := by
  classical
  exact ((Finset.Icc 1 N).powerset.filter SquareSumFree).sup Finset.card

theorem erdos_438 :
    Tendsto (fun N : ℕ ↦ (extremalSize N : ℝ) / (N : ℝ)) atTop (𝓝 ((11 : ℝ) / 32)) := by
  sorry

end Erdos438
