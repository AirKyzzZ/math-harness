import Mathlib

namespace Erdos424

open Set

def nextGeneration (A : Set ℕ) : Set ℕ :=
  { z : ℕ | ∃ x y, x ∈ A ∧ y ∈ A ∧ x ≠ y ∧ z = x * y - 1 }

def sequenceSet : ℕ → Set ℕ
  | 0 => {2, 3}
  | n + 1 => (sequenceSet n) ∪ (nextGeneration (sequenceSet n))

def generatedSet : Set ℕ := ⋃ n : ℕ, sequenceSet n

theorem erdos_424.variants.exact_density :
    generatedSet.HasPosDensity := by
  sorry

-- TODO(firsching): formalize the statements from the additional material

end Erdos424
