import Mathlib

universe u

variable {V : Type u}

namespace Erdos944

open Erdos944

def SimpleGraph.IsErdos944 (G : SimpleGraph V) (k r : ℕ) : Prop :=  G.IsCritical k ∧
    (∀ (edges : Set (Sym2 V)), G.IsCriticalEdges edges → r < edges.ncard)

theorem erdos_944.variants.dirac_conjecture :
    ∀ k ≥ 4, ∃ (V : Type u) (G : SimpleGraph V), G.IsErdos944 k 1 := by
  sorry

theorem erdos_944.variants.large_k_for_any_r (r : ℕ) (hr : 1 ≤ r) : ∀ᶠ k in Filter.atTop,
    ∃ (V : Type u) (G : SimpleGraph V), G.IsErdos944 k r := by
  sorry

  end Erdos944
