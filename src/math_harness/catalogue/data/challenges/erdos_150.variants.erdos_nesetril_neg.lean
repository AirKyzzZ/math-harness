import Mathlib

open Filter

open scoped Topology

namespace Erdos150

def IsMinimalCut {V : Type*} (G : SimpleGraph V) (T : Set V) : Prop :=
  ¬ (G.induce Tᶜ).Preconnected ∧ ∀ S ⊂ T, (G.induce Sᶜ).Preconnected

noncomputable def maxMinimalCuts (n : ℕ) : ℕ :=
  sSup {k | ∃ G : SimpleGraph (Fin n), {T : Set (Fin n) | IsMinimalCut G T}.ncard = k}

theorem erdos_150.variants.erdos_nesetril_neg :
    ¬ (¬ ∀ m : ℕ, maxMinimalCuts (3 * m + 2) = 3 ^ m) := by
  sorry

end Erdos150
