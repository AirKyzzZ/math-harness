import Mathlib

namespace Erdos1009

theorem erdos_1009.variants.sauer :
    ∀ r : ℕ, 1 ≤ r → ∃ G : SimpleGraph (Fin (2 * r + 4)), G.edgeSet.ncard = (2 * r + 4) ^ 2 / 4 + 2 * (2 * r + 4) - 6 ∧ ∀ T : Finset (Finset (Fin (2 * r + 4))), (∀ t ∈ T, G.IsNClique 3 t) → (T : Set (Finset (Fin (2 * r + 4)))).Pairwise (fun s t => (s ∩ t).card ≤ 1) → T.card ≤ 2 * (2 * r + 4) - 7 := by
  sorry

end Erdos1009
