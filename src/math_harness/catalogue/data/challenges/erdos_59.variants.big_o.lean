import Mathlib

open Filter SimpleGraph

namespace Erdos59

noncomputable def numFree {k : ℕ} (H : SimpleGraph (Fin k)) (n : ℕ) : ℕ :=
  {G : SimpleGraph (Fin n) | H.Free G}.ncard

theorem numFree_pos {k : ℕ} {H : SimpleGraph (Fin k)} (hH : H ≠ ⊥) (n : ℕ) :
    0 < numFree H n := by
  unfold numFree
  exact (Set.ncard_pos (Set.toFinite _)).2 ⟨⊥, SimpleGraph.free_bot hH⟩

theorem erdos_59.variants.big_o :
    ∀ (k : ℕ) (H : SimpleGraph (Fin k)), ¬ H.IsAcyclic → ∃ C : ℝ, 0 < C ∧ ∀ᶠ n : ℕ in atTop, (numFree H n : ℝ) ≤ (2 : ℝ) ^ (C * (extremalNumber n H : ℝ)) := by
  sorry

end Erdos59
