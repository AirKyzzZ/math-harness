import Mathlib

open Nat Filter Finset

namespace Erdos1201

noncomputable def Erdos1201Set (ε : ℝ) (k : ℕ) : Set ℕ :=
  { n : ℕ |
    ((sSup {p : ℕ | p.Prime ∧ p ∣ ∏ i ∈ range (k + 1), (n + i)} : ℕ) : ℝ) > (n : ℝ) ^ (1 - ε) }

open scoped Classical in
theorem erdos_1201_neg :
    ¬ (∀ ε > 0, ∀ η > 0, ∃ k : ℕ, atTop.liminf (fun x : ℕ ↦ (((count (· ∈ Erdos1201Set ε k) x : ℝ) / (x : ℝ)) : EReal)) ≥ (1 - η : EReal)) := by
  sorry

end Erdos1201
