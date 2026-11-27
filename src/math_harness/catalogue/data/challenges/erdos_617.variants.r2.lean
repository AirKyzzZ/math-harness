import Mathlib

namespace Erdos617

theorem erdos_617.variants.r2 :
    {r : ℕ | ∃ (V : Type) (_ : Fintype V) (_ : DecidableEq V), Fintype.card V = r^2 ∧ ∃ (coloring : Sym2 V → Fin r), ∀ (S : Finset V), S.card = r + 1 → ∀ (k : Fin r), ∃ u ∈ S, ∃ v ∈ S, u ≠ v ∧ coloring s(u, v) = k}.Infinite := by
  sorry

end Erdos617
