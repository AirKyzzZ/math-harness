import Mathlib

namespace Erdos1111

def Anticomplete {V : Type*} (G : SimpleGraph V) (A B : Set V) : Prop :=
  Disjoint A B ∧ ∀ a ∈ A, ∀ b ∈ B, ¬ G.Adj a b

theorem Anticomplete.symm {V : Type*} {G : SimpleGraph V} {A B : Set V}
    (h : Anticomplete G A B) : Anticomplete G B A := by
  obtain ⟨hd, h⟩ := h
  exact ⟨hd.symm, fun b hb a ha hba ↦ h a ha b hb hba.symm⟩

theorem erdos_1111_neg :
    ¬ (∀ t c : ℕ, 1 ≤ t → 1 ≤ c → ∃ d : ℕ, 1 ≤ d ∧ ∀ (V : Type*) [Finite V] (G : SimpleGraph V), (d : ℕ∞) ≤ G.chromaticNumber → G.CliqueFree t → ∃ A B : Set V, Anticomplete G A B ∧ (c : ℕ∞) ≤ (G.induce A).chromaticNumber ∧ (c : ℕ∞) ≤ (G.induce B).chromaticNumber) := by
  sorry

end Erdos1111
