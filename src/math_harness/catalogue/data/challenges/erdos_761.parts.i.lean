import Mathlib

universe u

namespace Erdos761

def IsAcyclicOn {V : Type*} (D : Digraph V) (S : Set V) : Prop :=
  ∀ v : V, ¬ Relation.TransGen (fun a b : V ↦ a ∈ S ∧ b ∈ S ∧ D.Adj a b) v v

def Dicolorable {V : Type*} (G : SimpleGraph V) (k : ℕ) : Prop :=
  ∀ D : Digraph V, D.IsOrientation G →
    ∃ c : V → Fin k, ∀ i : Fin k, IsAcyclicOn D {v | c v = i}

noncomputable def dichromaticNumber {V : Type*} (G : SimpleGraph V) : ℕ∞ :=
  ⨅ (k : ℕ) (_ : Dicolorable G k), (k : ℕ∞)

theorem dichromaticNumber_le {V : Type*} {G : SimpleGraph V} {k : ℕ}
    (h : Dicolorable G k) : dichromaticNumber G ≤ k :=
  iInf₂_le k h

theorem erdos_761.parts.i :
    ∀ k : ℕ, ∃ m : ℕ, ∀ (V : Type*) [Finite V] (G : SimpleGraph V), (m : ℕ∞) ≤ G.chromaticNumber → (k : ℕ∞) ≤ dichromaticNumber G := by
  sorry

end Erdos761
