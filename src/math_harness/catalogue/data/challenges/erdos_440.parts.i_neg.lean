import Mathlib

open Filter Real

namespace Erdos440

noncomputable def count (a : ℕ → ℕ) (x : ℕ) : ℕ :=
  {i | Nat.lcm (a i) (a (i + 1)) ≤ x}.ncard

theorem erdos_440.parts.i_neg :
    ¬ (∀ a : ℕ → ℕ, StrictMono a → (∀ i, 0 < a i) → (fun x : ℕ ↦ (count a x : ℝ)) =O[atTop] fun x : ℕ ↦ √x) := by
  sorry

def erdos_440.parts.ii.answer : ℝ := 1

noncomputable def erdosSzemerediConstant : ℝ := ∑' m : ℕ, 1 / (√(m + 1 : ℝ) * (m + 2))

end Erdos440
