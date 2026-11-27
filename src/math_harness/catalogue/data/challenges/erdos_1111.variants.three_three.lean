import Mathlib

namespace Erdos1111

def Anticomplete {V : Type*} (G : SimpleGraph V) (A B : Set V) : Prop :=
  Disjoint A B ∧ ∀ a ∈ A, ∀ b ∈ B, ¬ G.Adj a b

theorem Anticomplete.symm {V : Type*} {G : SimpleGraph V} {A B : Set V}
    (h : Anticomplete G A B) : Anticomplete G B A := by
  obtain ⟨hd, h⟩ := h
  exact ⟨hd.symm, fun b hb a ha hba ↦ h a ha b hb hba.symm⟩

theorem erdos_1111.variants.three_three :
    ∀ (V : Type*) [Finite V] (G : SimpleGraph V), 8 ≤ G.chromaticNumber → G.CliqueFree 3 → ∃ A B : Set V, Anticomplete G A B ∧ 3 ≤ (G.induce A).chromaticNumber ∧ 3 ≤ (G.induce B).chromaticNumber := by
  sorry

end Erdos1111
