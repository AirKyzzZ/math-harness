import Mathlib

open Filter Finset

namespace Erdos1033

open scoped Classical in
theorem erdos_1033.variants.erdos_laskar :
    ∃ C : ℝ, ∀ᶠ n : ℕ in atTop, ∃ G : SimpleGraph (Fin n), n ^ 2 < 4 * #G.edgeFinset ∧ ∀ t, G.IsNClique 3 t → ∑ v ∈ t, (G.degree v : ℝ) ≤ 2 * (Real.sqrt 3 - 1) * n + C := by
  sorry

end Erdos1033
