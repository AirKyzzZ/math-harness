import Mathlib

open Configuration

namespace Erdos1159

theorem erdos_1159 :
    ∃ C : ℕ, 1 < C ∧ ∀ (P L : Type) (_ : Membership P L) (_ : Fintype P) (_ : Fintype L), ∀ _ : ProjectivePlane P L, ∃ S : Set P, ∀ l : L, 1 ≤ (S ∩ {p : P | p ∈ l}).ncard ∧ (S ∩ {p : P | p ∈ l}).ncard ≤ C := by
  sorry

end Erdos1159
