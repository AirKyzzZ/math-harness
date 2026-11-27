import Mathlib

open Filter Real Finset

namespace Erdos664

theorem erdos_664.variants.block_design :
    ∀ c : ℝ, 0 < c → ∃ K : ℕ, ∀ (n m : ℕ) (A : Fin m → Finset (Fin n)), (∀ i, c * √n < (A i).card) → (∀ x y : Fin n, x ≠ y → ∃! i, x ∈ A i ∧ y ∈ A i) → ∃ B : Finset (Fin n), (∀ i, (B ∩ A i).Nonempty) ∧ ∀ i, (B ∩ A i).card ≤ K := by
  sorry

end Erdos664
