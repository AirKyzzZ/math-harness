import Mathlib

namespace Erdos1185

def HasAPWithStepInDiff (k : ℕ) (A B : Finset ℕ) : Prop :=
  ∃ a d : ℕ, 0 < d ∧ (∀ j : ℕ, j < k → a + j * d ∈ A) ∧ ∃ b₁ ∈ B, ∃ b₂ ∈ B, d = b₁ - b₂

theorem not_hasAPWithStepInDiff_singleton (k : ℕ) (A : Finset ℕ) (b : ℕ) :
    ¬ HasAPWithStepInDiff k A {b} := by
  rintro ⟨a, d, hd, -, b₁, hb₁, b₂, hb₂, rfl⟩
  simp only [Finset.mem_singleton] at hb₁ hb₂
  omega

theorem erdos_1185.variants.k_three :
    ∃ δ : ℝ, 0 < δ ∧ ∀ m : ℕ, 1 ≤ m → ∀ N₀ : ℕ, ∃ N : ℕ, ∃ A B : Finset ℕ, N₀ ≤ N ∧ A ⊆ Finset.Icc 1 N ∧ B ⊆ Finset.Icc 1 N ∧ δ * (N : ℝ) ≤ (A.card : ℝ) ∧ m ≤ B.card ∧ ¬ HasAPWithStepInDiff 3 A B := by
  sorry

end Erdos1185
