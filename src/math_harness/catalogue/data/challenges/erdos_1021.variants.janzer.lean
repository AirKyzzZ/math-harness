import Mathlib

open Filter Asymptotics

namespace Erdos1021

def cliqueSubdivision (k : ℕ) : SimpleGraph (Fin k ⊕ Set.powersetCard (Fin k) 2) where
  Adj x y :=
    match x, y with
    | Sum.inl i, Sum.inr p => i ∈ (p : Finset (Fin k))
    | Sum.inr p, Sum.inl i => i ∈ (p : Finset (Fin k))
    | _, _ => False
  symm := by
    constructor
    intro x y h
    cases x <;> cases y <;> simp_all
  loopless := by
    constructor
    intro x
    cases x <;> simp

theorem erdos_1021.variants.janzer (k : ℕ) (hk : 3 ≤ k) :
    (fun n : ℕ ↦ (SimpleGraph.extremalNumber n (cliqueSubdivision k) : ℝ)) =O[atTop] fun n : ℕ ↦ (n : ℝ) ^ (3 / 2 - 1 / (4 * (k : ℝ) - 6)) := by
  sorry

end Erdos1021
