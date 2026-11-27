import Mathlib

namespace Erdos582

def EdgeRamseyTriangle {V : Type*} (G : SimpleGraph V) : Prop :=
  ∀ c : G.edgeSet → Fin 2,
    ∃ (u v w : V) (huv : G.Adj u v) (hvw : G.Adj v w) (huw : G.Adj u w),
      c ⟨s(u, v), huv⟩ = c ⟨s(v, w), hvw⟩ ∧ c ⟨s(v, w), hvw⟩ = c ⟨s(u, w), huw⟩

theorem erdos_582_neg :
    ¬ (∃ (V : Type*) (_ : Fintype V) (G : SimpleGraph V), G.CliqueFree 4 ∧ EdgeRamseyTriangle G) := by
  sorry

end Erdos582
