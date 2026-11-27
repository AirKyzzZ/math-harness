import Mathlib

namespace Erdos1158

open Filter Asymptotics

theorem erdos_1158_neg :
    ¬ (∀ t r : ℕ, 2 ≤ t → 2 ≤ r → ∀ ε : ℝ, 0 < ε → ∀ᶠ n : ℕ in atTop, (n : ℝ) ^ ((t : ℝ) - (r : ℝ) ^ (1 - (t : ℝ)) - ε) ≤ (Hypergraph.partiteExtremalNumber n t r : ℝ)) := by
  sorry

end Erdos1158
