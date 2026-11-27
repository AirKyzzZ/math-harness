import Mathlib

open Filter

open scoped Topology

namespace Erdos150

def IsMinimalCut {V : Type*} (G : SimpleGraph V) (T : Set V) : Prop :=
  ¬ (G.induce Tᶜ).Preconnected ∧ ∀ S ⊂ T, (G.induce Sᶜ).Preconnected

noncomputable def maxMinimalCuts (n : ℕ) : ℕ :=
  sSup {k | ∃ G : SimpleGraph (Fin n), {T : Set (Fin n) | IsMinimalCut G T}.ncard = k}

theorem erdos_150.variants.upper_bound (α : ℝ) (hα : Tendsto (fun n : ℕ ↦ (maxMinimalCuts n : ℝ) ^ (1 / n : ℝ)) atTop (𝓝 α)) :
    α ≤ (1 + Real.sqrt 5) / 2 := by
  sorry

end Erdos150
