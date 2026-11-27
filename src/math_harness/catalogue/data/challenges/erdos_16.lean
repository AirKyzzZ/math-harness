import Mathlib

open Nat Filter Set

open scoped Topology

namespace Erdos16

def Erdos16Set : Set ℕ :=
  { n | Odd n ∧ ¬ ∃ k p : ℕ, p.Prime ∧ n = 2 ^ k + p }

def density_zero (S : Set ℕ) : Prop :=
  open scoped Classical in
  Tendsto (fun x : ℕ ↦ (count (· ∈ S) x : ℝ) / (x : ℝ)) atTop (𝓝 0)

theorem erdos_16 :
    ¬ ∃ A B : Set ℕ, Erdos16Set = A ∪ B ∧ (∃ a d : ℕ, d > 0 ∧ A = { x | ∃ m : ℕ, x = a + m * d }) ∧ density_zero B := by
  sorry

def positive_lower_density (S : Set ℕ) : Prop :=
  open scoped Classical in
  0 < atTop.liminf (fun n : ℕ ↦ ((count (· ∈ S) n : ℝ) / (n : ℝ) : EReal))

end Erdos16
