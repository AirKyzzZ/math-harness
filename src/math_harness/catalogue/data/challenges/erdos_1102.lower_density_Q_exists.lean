import Mathlib

open Squarefree Set Order Filter Topology

namespace Erdos1102

def HasPropertyP (A : Set ℕ) : Prop :=
  ∀ n ≥ 1, {a ∈ A | Squarefree (n + a)}.Finite

def HasPropertyQ (A : Set ℕ) : Prop :=
  {n : ℕ | ∀ a ∈ A, a < n → Squarefree (n + a)}.Infinite

theorem erdos_1102.lower_density_Q_exists :
    ∃ A : ℕ → ℕ, StrictMono A ∧ (∀ j, Squarefree (A j)) ∧ HasPropertyQ (range A) ∧ Tendsto (fun j : ℕ ↦ (j / A j : ℝ)) atTop (𝓝 (6 / Real.pi^2)) := by
  sorry

end Erdos1102
