import Mathlib

open Filter Real Finset

namespace Erdos664

theorem erdos_664_neg :
    ¬ (¬ ∀ c : ℝ, 0 < c → c < 1 → ∃ K : ℕ, ∀ (n m : ℕ) (A : Fin m → Finset (Fin n)), (∀ i, c * √n < (A i).card) → (∀ i j, i ≠ j → (A i ∩ A j).card ≤ 1) → ∃ B : Finset (Fin n), (∀ i, (B ∩ A i).Nonempty) ∧ ∀ i, (B ∩ A i).card ≤ K) := by
  sorry

end Erdos664
