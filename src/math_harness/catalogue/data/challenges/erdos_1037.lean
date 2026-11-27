import Mathlib

open Filter

namespace Erdos1037

theorem erdos_1037 :
    ¬ ∀ ε : ℝ, 0 < ε → ∀ C : ℝ, ∀ᶠ n : ℕ in atTop, ∀ G : SimpleGraph (Fin n), (∀ d : ℕ, {v : Fin n | (G.neighborSet v).ncard = d}.ncard ≤ 2) → ((1 / 2 + ε) * (n : ℝ) < ((Set.range fun v : Fin n => (G.neighborSet v).ncard).ncard : ℝ)) → ∃ s : Set (Fin n), G.IsHomogeneous s ∧ (C * Real.log (n : ℝ) < (s.ncard : ℝ)) := by
  sorry

end Erdos1037
