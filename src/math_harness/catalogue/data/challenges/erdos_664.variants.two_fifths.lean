import Mathlib

open Filter Real Finset

namespace Erdos664

theorem erdos_664.variants.two_fifths :
    ¬ ∃ K : ℕ, ∀ (n m : ℕ) (A : Fin m → Finset (Fin n)), (∀ i, 2 / 5 * √n < (A i).card) → (∀ i j, i ≠ j → (A i ∩ A j).card ≤ 1) → ∃ B : Finset (Fin n), (∀ i, (B ∩ A i).Nonempty) ∧ ∀ i, (B ∩ A i).card ≤ K := by
  sorry

end Erdos664
