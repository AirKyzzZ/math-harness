import Mathlib

open Filter

open scoped Topology

namespace Erdos150

def IsMinimalCut {V : Type*} (G : SimpleGraph V) (T : Set V) : Prop :=
  ¬ (G.induce Tᶜ).Preconnected ∧ ∀ S ⊂ T, (G.induce Sᶜ).Preconnected

noncomputable def maxMinimalCuts (n : ℕ) : ℕ :=
  sSup {k | ∃ G : SimpleGraph (Fin n), {T : Set (Fin n) | IsMinimalCut G T}.ncard = k}

theorem erdos_150.variants.seymour (m : ℕ) :
    3 ^ m ≤ maxMinimalCuts (3 * m + 2) := by
  sorry

end Erdos150
