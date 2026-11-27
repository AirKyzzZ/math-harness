import Mathlib

open Filter SimpleGraph

namespace Erdos911

theorem erdos_911_neg :
    ¬ (∃ f : ℝ → ℝ, Tendsto (fun x ↦ f x / x) atTop atTop ∧ ∃ C₀ : ℝ, ∀ C ≥ C₀, ∀ (n : ℕ) (G : SimpleGraph (Fin n)), 0 < n → C * n ≤ (G.edgeSet.ncard : ℝ) → f C * G.edgeSet.ncard < (sizeRamsey G G : ℝ)) := by
  sorry

end Erdos911
