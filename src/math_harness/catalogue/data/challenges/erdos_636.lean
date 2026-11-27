import Mathlib

open Filter

namespace Erdos636

def HasManyDistinctInducedSubgraphs {V : Type*} (G : SimpleGraph V) (k : ℝ) : Prop :=
  ∃ 𝒮 : Set (Set V), 𝒮.Pairwise (fun s t => s.ncard ≠ t.ncard ∨
      (G.induce s).edgeSet.ncard ≠ (G.induce t).edgeSet.ncard) ∧
    k ≤ (𝒮.ncard : ℝ)

theorem erdos_636 :
    ∀ C > (0 : ℝ), ∃ γ > (0 : ℝ), ∀ᶠ n : ℕ in atTop, ∀ G : SimpleGraph (Fin n), (G.cliqueNum : ℝ) < C * Real.log n → (G.indepNum : ℝ) < C * Real.log n → HasManyDistinctInducedSubgraphs G (γ * (n : ℝ) ^ (5 / 2 : ℝ)) := by
  sorry

end Erdos636
