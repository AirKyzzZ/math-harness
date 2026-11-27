import Mathlib

namespace Erdos46

theorem erdos_46.variants.infinitely_many_disjoint :
    ∀ (𝓒 : ℕ → ℕ), (Set.range 𝓒).Finite → ∃ S : ℕ → Finset ℕ, (∀ i j, i ≠ j → Disjoint (S i) (S j)) ∧ ∀ i, (∀ n ∈ S i, 2 ≤ n) ∧ ∑ n ∈ S i, (1 / n : ℚ) = 1 ∧ (𝓒 '' (S i : Set ℕ)).Subsingleton := by
  sorry

end Erdos46
