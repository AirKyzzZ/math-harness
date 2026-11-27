import Mathlib

open Filter SimpleGraph

namespace Erdos180

structure FiniteGraph where
  order : ℕ
  graph : SimpleGraph (Fin order)

def FamilyFree (family : Finset FiniteGraph) {n : ℕ} (host : SimpleGraph (Fin n)) : Prop :=
  ∀ forbidden ∈ family, forbidden.graph.Free host

open scoped Classical in
noncomputable def familyExtremal (family : Finset FiniteGraph) (n : ℕ) : ℕ :=
  (Finset.univ.filter (FamilyFree family)).sup
    fun host : SimpleGraph (Fin n) => host.edgeFinset.card

def IsCyclicFamily (family : Finset FiniteGraph) : Prop :=
  ∀ forbidden ∈ family, ¬ forbidden.graph.IsAcyclic

def IsCompactFamily (family : Finset FiniteGraph) : Prop :=
  ∃ forbidden ∈ family, ∃ C : ℝ, 0 < C ∧
    ∀ᶠ n : ℕ in atTop,
      (extremalNumber n forbidden.graph : ℝ) ≤ C * (familyExtremal family n : ℝ)

theorem erdos_180 :
    ¬ ∀ family : Finset FiniteGraph, family.Nonempty → IsCyclicFamily family → IsCompactFamily family := by
  sorry

end Erdos180
