import Mathlib

open Filter

namespace Erdos550

theorem erdos_550 :
    ∀ (k : ℕ) (hk : 2 ≤ k) (m : Fin k → ℕ) (hm : Monotone m) (hm_pos : ∀ i, 0 < m i), ∀ᶠ n : ℕ in atTop, ∀ (T : SimpleGraph (Fin n)), T.IsTree → SimpleGraph.graphRamsey T (SimpleGraph.completeMultipartiteGraph (fun i ↦ Fin (m i))) ≤ (k - 1) * (SimpleGraph.graphRamsey T (completeBipartiteGraph (Fin (m ⟨0, by omega⟩)) (Fin (m ⟨1, by omega⟩))) - 1) + m ⟨0, by omega⟩ := by
  sorry

-- TODO: Add variants of the problem.

end Erdos550
