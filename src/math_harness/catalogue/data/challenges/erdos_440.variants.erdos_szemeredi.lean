import Mathlib

open Filter Real

namespace Erdos440

noncomputable def count (a : ℕ → ℕ) (x : ℕ) : ℕ :=
  {i | Nat.lcm (a i) (a (i + 1)) ≤ x}.ncard

def erdos_440.parts.ii.answer : ℝ := 1

noncomputable def erdosSzemerediConstant : ℝ := ∑' m : ℕ, 1 / (√(m + 1 : ℝ) * (m + 2))

theorem erdos_440.variants.erdos_szemeredi :
    IsGreatest {l : ℝ | ∃ a : ℕ → ℕ, StrictMono a ∧ (∀ i, 0 < a i) ∧ l = limsup (fun x : ℕ ↦ (count a x : ℝ) / √x) atTop} erdosSzemerediConstant := by
  sorry

end Erdos440
