import Mathlib

namespace Erdos782

def ContainsQuasiProgression (S : Set ℕ) (C k : ℕ) : Prop :=
  ∃ (x : ℕ → ℕ) (d : ℕ), 0 < d ∧ (∀ i < k, x i ∈ S) ∧
    ∀ i, i + 1 < k → x i + d ≤ x (i + 1) ∧ x (i + 1) ≤ x i + d + C

def hilbertCube {d : ℕ} (a₀ : ℤ) (b : Fin d → ℤ) : Set ℤ :=
  {x | ∃ ε : Finset (Fin d), x = a₀ + ∑ i ∈ ε, b i}

theorem mem_hilbertCube_self {d : ℕ} (a₀ : ℤ) (b : Fin d → ℤ) :
    a₀ ∈ hilbertCube a₀ b :=
  ⟨∅, by simp⟩

theorem containsQuasiProgression_squares_three :
    ContainsQuasiProgression {n : ℕ | IsSquare n} 0 3 := by
  refine ⟨fun i ↦ 1 + 24 * i, 24, by norm_num, ?_, ?_⟩
  · intro i hi
    interval_cases i
    · exact ⟨1, by norm_num⟩
    · exact ⟨5, by norm_num⟩
    · exact ⟨7, by norm_num⟩
  · intro i _
    show 1 + 24 * i + 24 ≤ 1 + 24 * (i + 1) ∧ 1 + 24 * (i + 1) ≤ 1 + 24 * i + 24 + 0
    omega

theorem erdos_782.parts.ii_neg :
    ¬ (∀ d : ℕ, ∃ (a : ℤ) (b : Fin d → ℤ), (∀ i, b i ≠ 0) ∧ hilbertCube a b ⊆ {n : ℤ | IsSquare n}) := by
  sorry

end Erdos782
