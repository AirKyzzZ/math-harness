import Mathlib

open Filter

namespace Erdos934

def HasFarEdges {V : Type*} (G : SimpleGraph V) (t : ℕ) : Prop :=
  ∃ u v w x : V, G.Adj u v ∧ G.Adj w x ∧
    ∀ a ∈ ({u, v} : Set V), ∀ b ∈ ({w, x} : Set V), (t : ℕ∞) ≤ G.edist a b

noncomputable def h (t d : ℕ) : ℕ :=
  sInf {m : ℕ | ∀ (n : ℕ) (G : SimpleGraph (Fin n)),
    (∀ v, (G.neighborSet v).ncard ≤ d) → m ≤ G.edgeSet.ncard → HasFarEdges G t}

theorem h_le {t d m : ℕ}
    (hm : ∀ (n : ℕ) (G : SimpleGraph (Fin n)),
      (∀ v, (G.neighborSet v).ncard ≤ d) → m ≤ G.edgeSet.ncard → HasFarEdges G t) :
    h t d ≤ m := by
  unfold h
  exact Nat.sInf_le hm

theorem erdos_934.variants.h_one :
    ∀ d : ℕ, d ≠ 2 → h 1 d = d + 1 := by
  sorry

end Erdos934
