import Mathlib

open Squarefree Set Order Filter Topology

namespace Erdos1102

def HasPropertyP (A : Set ℕ) : Prop :=
  ∀ n ≥ 1, {a ∈ A | Squarefree (n + a)}.Finite

def HasPropertyQ (A : Set ℕ) : Prop :=
  {n : ℕ | ∀ a ∈ A, a < n → Squarefree (n + a)}.Infinite

theorem erdos_1102.exists_sequence_with_P (f : ℕ → ℕ) (h_inf : Tendsto f atTop atTop) (h_pos : ∀ n, f n ≠ 0) :
    ∃ A : ℕ → ℕ, StrictMono A ∧ HasPropertyP (range A) ∧ ∀ j : ℕ, (A j : ℝ) / j ≤ f j := by
  sorry

end Erdos1102
