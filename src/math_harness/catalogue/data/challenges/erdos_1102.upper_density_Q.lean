import Mathlib

open Squarefree Set Order Filter Topology

namespace Erdos1102

def HasPropertyP (A : Set ℕ) : Prop :=
  ∀ n ≥ 1, {a ∈ A | Squarefree (n + a)}.Finite

def HasPropertyQ (A : Set ℕ) : Prop :=
  {n : ℕ | ∀ a ∈ A, a < n → Squarefree (n + a)}.Infinite

theorem erdos_1102.upper_density_Q (A : ℕ → ℕ) (h_inc : StrictMono A) (hQ : HasPropertyQ (range A)) :
    limsup (fun j : ℕ ↦ (j / A j : ℝ)) atTop ≤ 6 / Real.pi^2 := by
  sorry

end Erdos1102
