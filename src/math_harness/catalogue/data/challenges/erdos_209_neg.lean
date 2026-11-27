import Mathlib

open EuclideanGeometry Affine

namespace Erdos209

noncomputable def pointMultiplicity (A : Finset (AffineSubspace ℝ ℝ²)) (p : ℝ²) : ℕ :=
  {L ∈ (A : Set (AffineSubspace ℝ ℝ²)) | p ∈ L}.ncard

def HasGallaiTriangle (A : Finset (AffineSubspace ℝ ℝ²)) : Prop :=
  ∃ L₁ ∈ A, ∃ L₂ ∈ A, ∃ L₃ ∈ A, L₁ ≠ L₂ ∧ L₂ ≠ L₃ ∧ L₁ ≠ L₃ ∧
    ∃ p₁ p₂ p₃ : ℝ², p₁ ≠ p₂ ∧ p₂ ≠ p₃ ∧ p₁ ≠ p₃ ∧
      p₁ ∈ L₁ ∧ p₁ ∈ L₂ ∧ p₂ ∈ L₂ ∧ p₂ ∈ L₃ ∧ p₃ ∈ L₃ ∧ p₃ ∈ L₁ ∧
      pointMultiplicity A p₁ = 2 ∧ pointMultiplicity A p₂ = 2 ∧ pointMultiplicity A p₃ = 2

theorem erdos_209_neg :
    ¬ (¬ ∀ d : ℕ, 4 ≤ d → ∀ A : Finset (AffineSubspace ℝ ℝ²), A.card = d → (∀ L ∈ A, IsLine L) → ((A : Set (AffineSubspace ℝ ℝ²)).Pairwise fun L₁ L₂ => ¬ L₁ ∥ L₂) → (∀ p : ℝ², pointMultiplicity A p ≤ 3) → HasGallaiTriangle A) := by
  sorry

end Erdos209
