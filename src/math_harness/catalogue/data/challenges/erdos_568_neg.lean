import Mathlib

namespace Erdos568

theorem erdos_568_neg :
    ¬ (∀ (V : Type) [Fintype V] (G : SimpleGraph V), (∃ c₁ > (0 : ℝ), ∀ (n : ℕ) (T : SimpleGraph (Fin n)), T.IsTree → (SimpleGraph.graphRamsey G T : ℝ) ≤ c₁ * n) → (∃ c₂ > (0 : ℝ), ∀ (n : ℕ), (SimpleGraph.graphRamsey G (SimpleGraph.completeGraph (Fin n)) : ℝ) ≤ c₂ * (n : ℝ) ^ 2) → G.IsRamseySizeLinear) := by
  sorry

end Erdos568
