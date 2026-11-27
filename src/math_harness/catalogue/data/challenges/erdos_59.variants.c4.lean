import Mathlib

open Filter SimpleGraph

namespace Erdos59

noncomputable def numFree {k : ℕ} (H : SimpleGraph (Fin k)) (n : ℕ) : ℕ :=
  {G : SimpleGraph (Fin n) | H.Free G}.ncard

theorem numFree_pos {k : ℕ} {H : SimpleGraph (Fin k)} (hH : H ≠ ⊥) (n : ℕ) :
    0 < numFree H n := by
  unfold numFree
  exact (Set.ncard_pos (Set.toFinite _)).2 ⟨⊥, SimpleGraph.free_bot hH⟩

theorem erdos_59.variants.c4 :
    ∀ ε > (0 : ℝ), ∀ᶠ n : ℕ in atTop, (numFree (cycleGraph 4) n : ℝ) ≤ (2 : ℝ) ^ ((1 + ε) * (extremalNumber n (cycleGraph 4) : ℝ)) := by
  sorry

end Erdos59
