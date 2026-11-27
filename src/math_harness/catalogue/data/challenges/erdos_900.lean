import Mathlib

open Filter SimpleGraph

open scoped Topology

namespace Erdos900

noncomputable def uniformEdgeProbability (n m : ℕ) (P : SimpleGraph (Fin n) → Prop) : ℝ :=
  (Set.ncard {G : SimpleGraph (Fin n) | G.edgeSet.ncard = m ∧ P G} : ℝ) /
    ((n.choose 2).choose m : ℝ)

def HasLongPath (n : ℕ) (a : ℝ) (G : SimpleGraph (Fin n)) : Prop :=
  pathGraph (⌈a * n⌉₊ + 1) ⊑ G

theorem uniformEdgeProbability_of_lt (n m : ℕ) (P : SimpleGraph (Fin n) → Prop)
    (h : n.choose 2 < m) : uniformEdgeProbability n m P = 0 := by
  simp [uniformEdgeProbability, Nat.choose_eq_zero_of_lt h]

theorem erdos_900 :
    ∃ f : ℝ → ℝ, (∀ c : ℝ, 1 / 2 < c → 0 < f c) ∧ Tendsto f (𝓝[>] (1 / 2)) (𝓝 0) ∧ Tendsto f atTop (𝓝 1) ∧ ∀ c : ℝ, 1 / 2 < c → Tendsto (fun n : ℕ ↦ uniformEdgeProbability n ⌊c * n⌋₊ (HasLongPath n (f c))) atTop (𝓝 1) := by
  sorry

end Erdos900
