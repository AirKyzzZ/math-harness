import Mathlib

open SimpleGraph

namespace Erdos842

def IsTrianglesPlusHamiltonianCycle {V : Type*} (G : SimpleGraph V) (n : ℕ) : Prop :=
  ∃ T C : SimpleGraph V, G = T ⊔ C ∧ Disjoint T C ∧
    (∃ e : V ≃ Fin n × Fin 3, ∀ u v, T.Adj u v ↔ u ≠ v ∧ (e u).1 = (e v).1) ∧
    ∃ e : Fin (3 * n) ≃ V, C = (cycleGraph (3 * n)).map e.toEmbedding

theorem erdos_842_neg :
    ¬ (∀ (V : Type) (G : SimpleGraph V) (n : ℕ), IsTrianglesPlusHamiltonianCycle G n → G.chromaticNumber ≤ 3) := by
  sorry

end Erdos842
