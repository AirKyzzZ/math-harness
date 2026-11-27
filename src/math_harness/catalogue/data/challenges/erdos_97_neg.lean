import Mathlib

open EuclideanGeometry

open Real

namespace Erdos97

def HasNEquidistantPointsAt (n : ℕ) (A : Finset ℝ²) (p : ℝ²) : Prop :=
  ∃ r : ℝ, r > 0 ∧ (A.filter fun q ↦ dist p q = r).card ≥ n

def HasNEquidistantPointsOn (n : ℕ) (A : Finset ℝ²) (B : Finset ℝ²) : Prop :=
  ∀ p ∈ B, HasNEquidistantPointsAt n A p

def HasNEquidistantProperty (n : ℕ) (A : Finset ℝ²) : Prop :=
  HasNEquidistantPointsOn n A A

def HasNUnitDistancePointsAt (n : ℕ) (A : Finset ℝ²) (p : ℝ²) : Prop :=
  (A.filter fun q ↦ dist p q = 1).card ≥ n

def HasNUnitDistancePointsOn (n : ℕ) (A : Finset ℝ²) (B : Finset ℝ²) : Prop :=
  ∀ p ∈ B, HasNUnitDistancePointsAt n A p

def HasNUnitDistanceProperty (n : ℕ) (A : Finset ℝ²) : Prop :=
  HasNUnitDistancePointsOn n A A

theorem erdos_97_neg :
    ¬ (∀ A : Finset ℝ², A.Nonempty → ConvexIndep A → ¬HasNEquidistantProperty 4 A) := by
  sorry

theorem erdos_97.variants.three_equidistant :
    ∃ A : Finset ℝ², A.Nonempty ∧ ConvexIndep A ∧ HasNEquidistantProperty 3 A := by
  let A₁ : ℝ² := !₂[(-√3), -1]
  let A₂ : ℝ² := !₂[(√3), -1]
  let A₃ : ℝ² := !₂[0, 2]
  let B₁ : ℝ² := !₂[(-8991 / 10927 * √3), -26503 / 10927]
  let B₂ : ℝ² := !₂[(17747 / 10927 * √3), -235 / 10927]
  let B₃ : ℝ² := !₂[(-8756 / 10927 * √3), 26738 / 10927]
  let C₁ : ℝ² := !₂[(-10753 / 18529 * √3), -44665 / 18529]
  let C₂ : ℝ² := !₂[(27709 / 18529 * √3), 6203 / 18529]
  let C₃ : ℝ² := !₂[(-16956 / 18529 * √3), 38462 / 18529]
  use {A₁, A₂, A₃, B₁, B₂, B₃, C₁, C₂, C₃}
  sorry

def IsCut (V A B : Finset ℝ²) : Prop :=
  A ∪ B = V ∧ Disjoint A B ∧
  Disjoint (convexHull ℝ (A : Set ℝ²)) (convexHull ℝ (B : Set ℝ²))

end Erdos97
