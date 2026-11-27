import Mathlib

open Filter Asymptotics EuclideanGeometry

namespace Erdos831

def circleRadii (P : Set ℝ²) : Set ℝ :=
  (fun s : Sphere ℝ² ↦ s.radius) '' {s : Sphere ℝ² | 3 ≤ {p ∈ P | p ∈ s}.ncard}

noncomputable def numRadii (P : Set ℝ²) : ℕ :=
  (circleRadii P).ncard

noncomputable def h (n : ℕ) : ℕ :=
  sInf {k : ℕ | ∃ P : Finset ℝ², P.card = n ∧ InGeneralPosition (P : Set ℝ²) ∧
    numRadii (P : Set ℝ²) = k}

theorem h_le {n : ℕ} (P : Finset ℝ²) (hcard : P.card = n) (hP : InGeneralPosition (P : Set ℝ²)) :
    h n ≤ numRadii (P : Set ℝ²) :=
  Nat.sInf_le ⟨P, hcard, hP, rfl⟩

theorem erdos_831.variants.szekeres (x₁ x₂ x₃ : ℝ²) (hcol : ¬ Collinear ℝ ({x₁, x₂, x₃} : Set ℝ²)) (hright : ¬ IsRightAngled x₁ x₂ x₃) :
    ∃! x₄ : ℝ², x₄ ∉ ({x₁, x₂, x₃} : Set ℝ²) ∧ InGeneralPosition ({x₁, x₂, x₃, x₄} : Set ℝ²) ∧ (circleRadii ({x₁, x₂, x₃, x₄} : Set ℝ²)).ncard = 1 := by
  sorry

end Erdos831
