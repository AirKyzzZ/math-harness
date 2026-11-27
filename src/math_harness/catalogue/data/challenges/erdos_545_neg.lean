import Mathlib

open Filter

namespace Erdos545

def knPlusTEdges (n t : ℕ) : SimpleGraph (Option (Fin n)) where
  Adj u v := match u, v with
    | some x, some y => x ≠ y
    | none, some y => y.val < t
    | some x, none => x.val < t
    | none, none => False
  symm.symm u v := by
    cases u <;> cases v <;> simp [ne_comm]
  loopless.irrefl u := by
    cases u <;> simp

theorem erdos_545_neg :
    ¬ (∀ᶠ m : ℕ in atTop, ∀ (n t : ℕ), t < n → m = n.choose 2 + t → ∀ (V : Type) [Fintype V] (G : SimpleGraph V) [DecidableRel G.Adj], (∀ v, 0 < G.degree v) → G.edgeSet.ncard = m → SimpleGraph.diagonalGraphRamsey G ≤ SimpleGraph.diagonalGraphRamsey (knPlusTEdges n t)) := by
  sorry

-- TODO: Add variants of the problem.

end Erdos545
