import Mathlib

namespace Erdos617

theorem erdos_617.variants.r_eq_4 (r : ℕ) (hr : r ≥ 3) {V : Type} [Fintype V] [DecidableEq V] (hV : Fintype.card V = 4^2 + 1) (coloring : Sym2 V → Fin 4) :
    ∃ (S : Finset V) (k : Fin 4), S.card = 4 + 1 ∧ ∀ u ∈ S, ∀ v ∈ S, u ≠ v → coloring s(u, v) ≠ k := by
  sorry

end Erdos617
