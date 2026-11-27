import Mathlib

open Filter Real

open scoped Topology

namespace Erdos793

def Strongly2Primitive (A : Finset ℕ) : Prop :=
  ∀ a ∈ A, ∀ b ∈ A, ∀ c ∈ A, a ≠ b → a ≠ c → ¬ a ∣ b * c

noncomputable def F (n : ℕ) : ℕ := by
  classical
  exact ((Finset.Icc 1 n).powerset.filter Strongly2Primitive).sup Finset.card

theorem erdos_793 :
    ∃ c : ℝ, Tendsto (fun n : ℕ ↦ ((F n : ℝ) - Nat.primeCounting n) / ((n : ℝ) ^ ((2 : ℝ) / 3) / (log n) ^ 2)) atTop (𝓝 c) := by
  sorry

end Erdos793
