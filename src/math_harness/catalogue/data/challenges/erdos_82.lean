import Mathlib

open SimpleGraph Filter

namespace Erdos82

variable {V : Type*} [Fintype V]

def IsRegularInduced {G : SimpleGraph V} (S : Subgraph G) : Prop :=
  open scoped Classical in
  S.IsInduced ∧ ∃ k, (S.coe).IsRegularOfDegree k

noncomputable def F (n : ℕ) : ℕ :=
  sSup {k | ∀ (G : SimpleGraph (Fin n)), ∃ S : Subgraph G,
    IsRegularInduced S ∧ k ≤ S.verts.ncard}

theorem erdos_82 :
    Tendsto (fun n => F n / Real.log n) atTop atTop := by
  sorry

end Erdos82
