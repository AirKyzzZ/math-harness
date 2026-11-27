import Mathlib

open Filter Finset EuclideanGeometry

namespace Erdos655

def IsValid (X : Finset ℝ²) : Prop :=
  ∀ᵉ (x ∈ X) (r > 0), ¬3 ≤ (Metric.sphere x r ∩ X).ncard

theorem erdos_655_neg :
    ¬ (¬ ∃ c > (0 : ℝ), ∀ᶠ n in atTop, ∀ (X : Finset ℝ²), #X = n → IsValid X → (1 + c) * n / 2 ≤ distinctDistances X) := by
  sorry

end Erdos655
