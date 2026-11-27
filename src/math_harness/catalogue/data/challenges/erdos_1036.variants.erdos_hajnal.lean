import Mathlib

open Filter

namespace Erdos1036

def HasManyNonIsomorphicInducedSubgraphs {V : Type*} (G : SimpleGraph V) (k : ℝ) : Prop :=
  ∃ 𝒮 : Set (Set V), (𝒮.Pairwise fun s t => IsEmpty (G.induce s ≃g G.induce t)) ∧
    k ≤ (𝒮.ncard : ℝ)

def NoLargeBiclique {V : Type*} (G : SimpleGraph V) (m : ℝ) : Prop :=
  ∀ k : ℕ, ((completeBipartiteGraph (Fin k) (Fin k)).IsContained G ∨
    (completeBipartiteGraph (Fin k) (Fin k)).IsContained Gᶜ) → (2 * k : ℝ) ≤ m

theorem erdos_1036.variants.erdos_hajnal :
    ∀ c : ℝ, 0 < c → ∃ δ : ℝ, 0 < δ ∧ ∀ᶠ n : ℕ in atTop, ∀ G : SimpleGraph (Fin n), NoLargeBiclique G (c * Real.log (n : ℝ)) → HasManyNonIsomorphicInducedSubgraphs G ((2 : ℝ) ^ (δ * (n : ℝ))) := by
  sorry

end Erdos1036
