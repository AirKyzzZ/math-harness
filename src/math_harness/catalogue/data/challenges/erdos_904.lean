import Mathlib

namespace Erdos904

open Finset

abbrev n (V : Type*) [Fintype V] : ℕ := Fintype.card V

abbrev turanNumber (n r : ℕ) : ℕ := #(SimpleGraph.turanGraph n r).edgeFinset

theorem erdos_904 :
    ∀ (V : Type*) [Fintype V] (G : SimpleGraph V) [DecidableRel G.Adj] (r : ℕ) (hr : r ∈ Set.Icc 1 (n V)) (hm : turanNumber (n V) r ≤ #G.edgeFinset), ∃ s, G.IsNClique r s ∧ 2 * r * #G.edgeFinset ≤ n V * ∑ v ∈ s, G.degree v := by
  sorry

end Erdos904
