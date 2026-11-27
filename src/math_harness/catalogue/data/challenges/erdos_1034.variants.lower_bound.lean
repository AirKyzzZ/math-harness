import Mathlib

open Filter

namespace Erdos1034

def JoinedToTwo {V : Type*} (G : SimpleGraph V) (T Y : Finset V) : Prop :=
  ∀ y ∈ Y, ∃ u ∈ T, ∃ v ∈ T, u ≠ v ∧ G.Adj y u ∧ G.Adj y v

theorem erdos_1034.variants.lower_bound (ε : ℝ) (hε : 0 < ε) :
    ∀ᶠ (n : ℕ) in atTop, ∀ G : SimpleGraph (Fin n), (n : ℝ) ^ 2 / 4 < (G.edgeSet.ncard : ℝ) → ∃ T : Finset (Fin n), G.IsNClique 3 T ∧ ∃ Y : Finset (Fin n), JoinedToTwo G T Y ∧ (1 / 6 - ε) * (n : ℝ) ≤ (Y.card : ℝ) := by
  sorry

end Erdos1034
