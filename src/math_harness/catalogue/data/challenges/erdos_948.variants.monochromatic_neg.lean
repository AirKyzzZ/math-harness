import Mathlib

namespace Erdos948

theorem erdos_948.variants.monochromatic_neg :
    ¬ (¬ ∃ (f : ℕ → ℕ) (k : ℕ), 2 ≤ k ∧ ∀ colouring : ℤ → Fin k, ∃ a : ℕ → ℤ, StrictMono a ∧ {n | a n < f n}.Infinite ∧ ∃ c : Fin k, ∀ S : Finset ℕ, S.Nonempty → colouring (∑ i ∈ S, a i) = c) := by
  sorry

end Erdos948
