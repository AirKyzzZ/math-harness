import Mathlib

open Filter

namespace Erdos563

open scoped Classical in
def HasBalancedSubsets (n : ℕ) (m : ℕ) (α : ℝ) (G : SimpleGraph (Fin n)) : Prop :=
  ∀ (X : Finset (Fin n)), m ≤ X.card →
    α * (X.card.choose 2 : ℝ) < ((G.induce (X : Set (Fin n))).edgeFinset.card : ℝ) ∧
    ((G.induce (X : Set (Fin n))).edgeFinset.card : ℝ) < (1 - α) * (X.card.choose 2 : ℝ)

open scoped Classical in
noncomputable def F (n : ℕ) (α : ℝ) : ℕ :=
  sInf {m | ∃ (G : SimpleGraph (Fin n)), HasBalancedSubsets n m α G}

theorem erdos_563 :
    ∀ (α : ℝ), 0 ≤ α → α < 1 / 2 → ∃ (c : ℝ), 0 < c ∧ Tendsto (fun n : ℕ => (F n α : ℝ) / Real.log n) atTop (nhds c) := by
  sorry

-- TODO: Add variants of the problem.

end Erdos563
