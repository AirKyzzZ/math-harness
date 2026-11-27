import Mathlib

open Filter

namespace Erdos1036

def HasManyNonIsomorphicInducedSubgraphs {V : Type*} (G : SimpleGraph V) (k : ℝ) : Prop :=
  ∃ 𝒮 : Set (Set V), (𝒮.Pairwise fun s t => IsEmpty (G.induce s ≃g G.induce t)) ∧
    k ≤ (𝒮.ncard : ℝ)

def NoLargeBiclique {V : Type*} (G : SimpleGraph V) (m : ℝ) : Prop :=
  ∀ k : ℕ, ((completeBipartiteGraph (Fin k) (Fin k)).IsContained G ∨
    (completeBipartiteGraph (Fin k) (Fin k)).IsContained Gᶜ) → (2 * k : ℝ) ≤ m

theorem erdos_1036.variants.alon_hajnal :
    ∀ c : ℝ, 0 < c → ∃ C : ℝ, 0 < C ∧ ∀ᶠ n : ℕ in atTop, ∀ G : SimpleGraph (Fin n), G.IsCRamsey c → HasManyNonIsomorphicInducedSubgraphs G (Real.exp ((n : ℝ) * Real.log (n : ℝ) ^ (-(C * Real.log (Real.log (n : ℝ)))))) := by
  sorry

end Erdos1036
