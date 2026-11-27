import Mathlib

open Filter

namespace Erdos611

def AllMaximalCliquesAtLeast {V : Type} (G : SimpleGraph V) (k : ℝ) : Prop :=
  ∀ s ∈ G.cliqueSizes, k ≤ (s : ℝ)

noncomputable def cliqueThreshold (c : ℝ) (n : ℕ) : ℕ :=
  sInf {k : ℕ | ∀ G : SimpleGraph (Fin n), AllMaximalCliquesAtLeast G (k : ℝ) →
    (G.cliqueTransversalNumber : ℝ) < (1 - c) * (n : ℝ)}

theorem erdos_611.variants.bollobas_erdos :
    ∀ n : ℕ, ∀ G : SimpleGraph (Fin n), AllMaximalCliquesAtLeast G ((n : ℝ) + 3 - 2 * Real.sqrt (n : ℝ)) → G.cliqueTransversalNumber = 1 := by
  sorry

end Erdos611
