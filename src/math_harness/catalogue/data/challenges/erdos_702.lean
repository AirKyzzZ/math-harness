import Mathlib

open Filter Finset

namespace Erdos702

theorem erdos_702 (k : ℕ) (hk : 4 ≤ k) :
    ∀ᶠ n in atTop, ∀ 𝓕 : Finset (Finset (Fin n)), 𝓕.IsUniform k → (n - 2).choose (k - 2) < 𝓕.card → ∃ A ∈ 𝓕, ∃ B ∈ 𝓕, (A ∩ B).card = 1 := by
  sorry

theorem erdos_702.variants.all_n_false :
    ¬ ∀ k : ℕ, 4 ≤ k → ∀ (n : ℕ) (𝓕 : Finset (Finset (Fin n))), 𝓕.IsUniform k →
      (n - 2).choose (k - 2) < 𝓕.card → ∃ A ∈ 𝓕, ∃ B ∈ 𝓕, (A ∩ B).card = 1 := by
  intro h
  obtain ⟨A, hA, B, hB, hAB⟩ := h 4 le_rfl 5 {A | A.card = 4}
    (fun A hA ↦ (mem_filter.1 hA).2) (by decide)
  revert A B
  decide

end Erdos702
