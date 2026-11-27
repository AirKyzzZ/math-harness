import Mathlib

open scoped Pointwise

namespace Erdos1146

def IsEssentialComponent (A : Set ℕ) : Prop :=
  open scoped Classical in
  ∀ B : Set ℕ,
    let b := schnirelmannDensity B;
    0 < b → b < 1 → schnirelmannDensity ((A ∪ {0}) + (B ∪ {0})) > b

theorem erdos_1146 :
    IsEssentialComponent { k | ∃ m n : ℕ, k = 2 ^ m * 3 ^ n } := by
  sorry

end Erdos1146
