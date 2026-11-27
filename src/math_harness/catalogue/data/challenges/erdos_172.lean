import Mathlib

namespace Erdos172

theorem erdos_172 :
    ∀ (n : ℕ) (color : ℕ → Fin n) (m), ∃ (A : Finset ℕ), A.card ≥ m ∧ ∃ c, ∀ (S : Finset A), S.Nonempty → color (∑ x ∈ S, x) = c ∧ color (∏ x ∈ S, x) = c := by
  sorry

-- TODO: add the statements from the additional material

end Erdos172
