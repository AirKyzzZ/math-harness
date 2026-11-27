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

theorem erdos_82.variants.F_upper_bound :
    (fun n => (F n : ℝ)) =O[atTop] (fun n => Real.sqrt n * (Real.log n) ^ (3 / 4 : ℝ)) := by
  sorry

end Erdos82
