import Mathlib

open SimpleGraph

namespace Erdos767

def HasCycleWithIncidentChords {V : Type*} (G : SimpleGraph V) (k : ℕ) : Prop :=
  ∃ (v : V) (c : G.Walk v v), c.IsCycle ∧
    ∃ f : Fin k → V, Function.Injective f ∧ ∀ i, c.IsChord s(v, f i)

open scoped Classical in
noncomputable def g (k n : ℕ) : ℕ :=
  sSup {m | ∃ G : SimpleGraph (Fin n),
    ¬ HasCycleWithIncidentChords G k ∧ G.edgeFinset.card = m}

theorem erdos_767 :
    ∀ k ≥ 1, ∀ n ≥ 3 * k + 3, g k n = (k + 1) * n - (k + 1) ^ 2 := by
  sorry

end Erdos767
