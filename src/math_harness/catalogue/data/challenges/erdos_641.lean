import Mathlib

open SimpleGraph

namespace Erdos641

open scoped Classical in
def IsCycleGraph {V : Type*} [Fintype V] (C : SimpleGraph V) : Prop :=
  C.Connected ∧ C.IsRegularOfDegree 2

def HasCommonVertexCycles {V : Type*} [Fintype V] (G : SimpleGraph V) (k : ℕ) : Prop :=
  ∃ m : ℕ, 0 < m ∧
    ∃ C : Fin k → SimpleGraph (Fin m),
      (∀ i, IsCycleGraph (C i)) ∧
      (∀ ⦃i j : Fin k⦄, i ≠ j → Disjoint (C i) (C j)) ∧
      Nonempty (SimpleGraph.Copy (⨆ i, C i) G)

def ErdosHajnalProperty (f : ℕ → ℕ) : Prop :=
  ∀ k : ℕ, 1 ≤ k →
    ∀ (V : Type) [Fintype V] (G : SimpleGraph V),
      (f k : ℕ∞) ≤ G.chromaticNumber → HasCommonVertexCycles G k

theorem erdos_641 :
    ¬ ∃ f : ℕ → ℕ, ErdosHajnalProperty f := by
  sorry

end Erdos641
