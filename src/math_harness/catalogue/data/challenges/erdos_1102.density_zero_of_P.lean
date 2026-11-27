import Mathlib

open Squarefree Set Order Filter Topology

namespace Erdos1102

def HasPropertyP (A : Set ℕ) : Prop :=
  ∀ n ≥ 1, {a ∈ A | Squarefree (n + a)}.Finite

def HasPropertyQ (A : Set ℕ) : Prop :=
  {n : ℕ | ∀ a ∈ A, a < n → Squarefree (n + a)}.Infinite

theorem erdos_1102.density_zero_of_P (A : ℕ → ℕ) (h_inc : StrictMono A) (hP : HasPropertyP (range A)) :
    Tendsto (fun j => (A j / j : ℝ)) atTop atTop := by
  sorry

end Erdos1102
