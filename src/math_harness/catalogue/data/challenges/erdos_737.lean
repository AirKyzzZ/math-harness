import Mathlib

namespace Erdos737

def ChromaticNumberAlephOne {V : Type*} (G : SimpleGraph V) : Prop :=
  Nonempty (G.Coloring (Set.Iio (Ordinal.omega.{0} 1))) ∧ IsEmpty (G.Coloring ℕ)

def CycleThroughEdgeOfLength {V : Type*} (G : SimpleGraph V) (e : Sym2 V) (n : ℕ) : Prop :=
  ∃ v : V, ∃ c : G.Walk v v, c.IsCycle ∧ c.length = n ∧ e ∈ c.edges

theorem not_chromaticNumberAlephOne_bot : ¬ ChromaticNumberAlephOne (⊥ : SimpleGraph ℕ) := by
  intro h
  have : Nonempty ((⊥ : SimpleGraph ℕ).Coloring ℕ) :=
    ⟨SimpleGraph.Coloring.mk (fun _ => 0) (by simp)⟩
  exact (not_isEmpty_iff.mpr this) h.2

theorem erdos_737 :
    ∀ (V : Type) (G : SimpleGraph V), ChromaticNumberAlephOne G → ∃ e ∈ G.edgeSet, ∃ N : ℕ, ∀ n : ℕ, N ≤ n → CycleThroughEdgeOfLength G e n := by
  sorry

end Erdos737
