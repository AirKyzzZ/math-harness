import Mathlib

namespace Erdos151

open SimpleGraph

noncomputable def H (n : ℕ) : ℕ :=
  sSup {k | ∀ G : SimpleGraph (Fin n), G.CliqueFree 3 → ∃ s, G.IsNIndepSet k s}

theorem erdos_151.variants.cliqueFree_three (n : ℕ) (G : SimpleGraph (Fin n)) (hG : G.CliqueFree 3) :
    cliqueTransversalNumber G ≤ n - H n := by
  sorry

end Erdos151
