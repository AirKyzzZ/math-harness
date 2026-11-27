import Mathlib

open Filter

namespace Erdos1037

theorem erdos_1037.variants.cambie_chan_hunter :
    ∃ C : ℝ, ∀ᶠ n : ℕ in atTop, ∃ G : SimpleGraph (Fin n), (∀ d : ℕ, {v : Fin n | (G.neighborSet v).ncard = d}.ncard ≤ 2) ∧ (3 / 4 * (n : ℝ) ≤ ((Set.range fun v : Fin n => (G.neighborSet v).ncard).ncard : ℝ)) ∧ ∀ s : Set (Fin n), G.IsHomogeneous s → ((s.ncard : ℝ) ≤ C * Real.log (n : ℝ)) := by
  sorry

end Erdos1037
