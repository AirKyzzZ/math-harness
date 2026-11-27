import Mathlib

namespace Erdos489

open Filter

open scoped Topology

def sievedSet (A : Set ℕ) : Set ℕ := {n : ℕ | 0 < n ∧ ∀ a ∈ A, ¬(a ∣ n)}

noncomputable def GapSumSq (A : Set ℕ) (x : ℕ) : ℝ :=
  open scoped Classical in
  letI B := sievedSet A
  let b := Nat.nth (· ∈ B)
  ∑ i < Nat.count (· ∈ B) x, ((b (i + 1) : ℝ) - b i) ^ 2

theorem erdos_489.variants.squarefree :
    ∃ L : ℝ, Tendsto (fun x : ℕ => GapSumSq {n | ∃ p, Nat.Prime p ∧ n = p ^ 2} x / (x : ℝ)) atTop (𝓝 L) := by
  sorry

end Erdos489
