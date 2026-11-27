import Mathlib

open Filter

namespace Erdos611

def AllMaximalCliquesAtLeast {V : Type} (G : SimpleGraph V) (k : ℝ) : Prop :=
  ∀ s ∈ G.cliqueSizes, k ≤ (s : ℝ)

noncomputable def cliqueThreshold (c : ℝ) (n : ℕ) : ℕ :=
  sInf {k : ℕ | ∀ G : SimpleGraph (Fin n), AllMaximalCliquesAtLeast G (k : ℝ) →
    (G.cliqueTransversalNumber : ℝ) < (1 - c) * (n : ℝ)}

theorem erdos_611.variants.bollobas_erdos_sharp :
    ∀ m : ℕ, 2 ≤ m → ∃ G : SimpleGraph (Fin (m ^ 2)), AllMaximalCliquesAtLeast G ((m : ℝ) ^ 2 + 2 - 2 * (m : ℝ)) ∧ 2 ≤ G.cliqueTransversalNumber := by
  sorry

end Erdos611
