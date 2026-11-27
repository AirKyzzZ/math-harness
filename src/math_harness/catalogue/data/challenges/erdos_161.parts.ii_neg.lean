import Mathlib

namespace Erdos161

open Filter Asymptotics

theorem erdos_161.parts.ii_neg :
    ¬ (∀ t : ℕ, 3 ≤ t → ∀ α β : ℝ, 0 < α → α < 1 / 2 → 0 < β → β < 1 / 2 → (fun n ↦ (Hypergraph.balancedColoringThreshold n t α : ℝ)) =Θ[atTop] (fun n ↦ (Hypergraph.balancedColoringThreshold n t β : ℝ))) := by
  sorry

end Erdos161
