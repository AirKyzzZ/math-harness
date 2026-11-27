import Mathlib

namespace Erdos151

open SimpleGraph

noncomputable def H (n : ℕ) : ℕ :=
  sSup {k | ∀ G : SimpleGraph (Fin n), G.CliqueFree 3 → ∃ s, G.IsNIndepSet k s}

theorem erdos_151.variants.sqrt_bound (n : ℕ) (G : SimpleGraph (Fin n)) :
    cliqueTransversalNumber G ≤ n - Nat.sqrt n := by
  sorry

end Erdos151
