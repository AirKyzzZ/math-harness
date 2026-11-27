import Mathlib

open Filter

namespace Erdos191

theorem erdos_191.variants.three_colours :
    ∃ C : ℝ, ∀ n : ℕ, ∃ c : Sym2 (Finset.Icc 2 n) → Fin 3, ∀ X : Finset (Finset.Icc 2 n), (∃ i : Fin 3, ∀ x ∈ X, ∀ y ∈ X, x ≠ y → c s(x, y) = i) → ∑ x ∈ X, 1 / Real.log (x : ℕ) < C := by
  sorry

end Erdos191
