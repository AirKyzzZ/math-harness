import Mathlib

open Filter

namespace Erdos611

def AllMaximalCliquesAtLeast {V : Type} (G : SimpleGraph V) (k : ℝ) : Prop :=
  ∀ s ∈ G.cliqueSizes, k ≤ (s : ℝ)

noncomputable def cliqueThreshold (c : ℝ) (n : ℕ) : ℕ :=
  sInf {k : ℕ | ∀ G : SimpleGraph (Fin n), AllMaximalCliquesAtLeast G (k : ℝ) →
    (G.cliqueTransversalNumber : ℝ) < (1 - c) * (n : ℝ)}

theorem erdos_611.parts.i_neg :
    ¬ (∀ c > (0 : ℝ), ∀ ε > (0 : ℝ), ∀ᶠ n : ℕ in atTop, ∀ G : SimpleGraph (Fin n), AllMaximalCliquesAtLeast G (c * (n : ℝ)) → (G.cliqueTransversalNumber : ℝ) ≤ ε * (n : ℝ)) := by
  sorry

end Erdos611
