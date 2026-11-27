import Mathlib

namespace Erdos46

theorem erdos_46.variants.positive_rat :
    ∀ (𝓒 : ℕ → ℕ), (Set.range 𝓒).Finite → ∀ q : ℚ, 0 < q → ∃ S : Finset ℕ, (∀ n ∈ S, 2 ≤ n) ∧ ∑ n ∈ S, (1 / n : ℚ) = q ∧ (𝓒 '' (S : Set ℕ)).Subsingleton := by
  sorry

end Erdos46
