import Mathlib

namespace Erdos307

open scoped Finset

theorem erdos_307.variants.coprime : ∃ P Q : Finset ℕ, 0 ∉ P ∩ Q ∧ 1 < #P ∧ 1 < #Q ∧
    Set.Pairwise P Nat.Coprime ∧ Set.Pairwise Q Nat.Coprime ∧
    1 = (∑ p ∈ P, (p : ℚ)⁻¹) * (∑ q ∈ Q, (q : ℚ)⁻¹) := by
  simp only [Finset.mem_inter, not_and]
  use {1, 5}, {2, 3}
  norm_num +decide

theorem erdos_307.barrier {P Q : Finset ℕ} (hP : ∀ p ∈ P, p.Prime) (hQ : ∀ q ∈ Q, q.Prime) (hQne : Q.Nonempty) (heq : 1 = (∑ p ∈ P, (p : ℚ)⁻¹) * (∑ q ∈ Q, (q : ℚ)⁻¹)) :
    59 ≤ #(P ∪ Q) ∧ (4 * 10 ^ 112 : ℚ) ≤ (∏ p ∈ P, (p : ℚ)) ^ 2 := by
  sorry

end Erdos307
