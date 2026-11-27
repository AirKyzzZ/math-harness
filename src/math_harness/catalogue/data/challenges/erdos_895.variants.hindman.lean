import Mathlib

open Filter

namespace Erdos895

theorem erdos_895.variants.hindman :
    ∀ k : ℕ, ∀ᶠ n in atTop, ∀ G : SimpleGraph (Set.Icc 1 n), G.CliqueFree 3 → ∃ a : Fin k → ℕ, StrictMono a ∧ ∃ I : Set (Set.Icc 1 n), G.IsIndepSet I ∧ Subtype.val '' I = {m | ∃ S : Finset (Fin k), S.Nonempty ∧ m = ∑ i ∈ S, a i} := by
  sorry

end Erdos895
