import Mathlib

open Filter

namespace Erdos1027

variable {α : Type*} [DecidableEq α]

def groundSet (F : Finset (Finset α)) : Finset α := F.biUnion id

open scoped Classical in
def goodSets (F : Finset (Finset α)) : Finset (Finset α) :=
  (groundSet F).powerset.filter fun B ↦ ∀ A ∈ F, (A ∩ B).Nonempty ∧ ¬ A ⊆ B

theorem erdos_1027 :
    ∀ c : ℝ, 0 < c → ∃ δ : ℝ, 0 < δ ∧ ∀ᶠ n : ℕ in atTop, ∀ (α : Type) [DecidableEq α] (F : Finset (Finset α)), (∀ A ∈ F, A.card = n) → (F.card : ℝ) ≤ c * 2 ^ n → δ * 2 ^ (groundSet F).card ≤ (goodSets F).card := by
  sorry

end Erdos1027
