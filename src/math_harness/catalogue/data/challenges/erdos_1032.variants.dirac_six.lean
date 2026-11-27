import Mathlib

open Filter

namespace Erdos1032

def IsKCritical {V : Type*} (G : SimpleGraph V) (k : ℕ) : Prop :=
  G.IsCritical k ∧ ∀ e ∈ G.edgeSet, G.IsCriticalEdge e

open scoped Classical in
theorem erdos_1032.variants.dirac_six :
    ∃ᶠ n : ℕ in atTop, ∃ G : SimpleGraph (Fin n), IsKCritical G 6 ∧ (n : ℝ) / 2 < (G.minDegree : ℝ) := by
  sorry

end Erdos1032
