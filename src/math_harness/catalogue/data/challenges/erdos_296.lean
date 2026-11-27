import Mathlib

namespace Erdos296

open Filter

def recipSum (A : Finset ℕ) : ℚ :=
  ∑ n ∈ A, (1 : ℚ) / n

def HasDisjointUnitDecomps (N k : ℕ) : Prop :=
  ∃ f : Fin k → Finset ℕ,
    (∀ i, f i ⊆ Finset.Icc 1 N) ∧
    (∀ i, recipSum (f i) = 1) ∧
    (∀ i j : Fin k, i ≠ j → Disjoint (f i) (f j))

theorem erdos_296 :
    (∀ N k : ℕ, HasDisjointUnitDecomps N k → (k : ℚ) ≤ recipSum (Finset.Icc 1 N)) ∧ (∀ ε : ℝ, 0 < ε → ε < 1 → ∀ᶠ N : ℕ in atTop, HasDisjointUnitDecomps N ⌊(1 - ε) * Real.log N⌋₊) := by
  sorry

end Erdos296
