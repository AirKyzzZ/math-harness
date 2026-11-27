import Mathlib

open Filter

open scoped EuclideanGeometry Asymptotics

namespace Erdos756

noncomputable def richDistances (A : Finset ℝ²) (k : ℕ) : Finset ℝ :=
  (distanceSet A).filter fun d => k ≤ distanceMultiplicity A d

noncomputable def maxRichDistances (n : ℕ) : ℕ :=
  sSup {(richDistances A (n + 1)).card | (A : Finset ℝ²) (_ : A.card = n)}

theorem erdos_756.variants.bhowmick (n : ℕ) :
    ∃ A : Finset ℝ², A.card = n ∧ n / 4 ≤ (richDistances A (n + 1)).card := by
  sorry

end Erdos756
