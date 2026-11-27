import Mathlib

open SimpleGraph

namespace Erdos640

def HasHighChromaticOddCycle {V : Type*} (G : SimpleGraph V) (k : ℕ) : Prop :=
  ∃ v, ∃ p : G.Walk v v, p.IsCycle ∧ Odd p.length ∧
    (k : ℕ∞) ≤ (G.induce {x | x ∈ p.support}).chromaticNumber

theorem erdos_640 :
    ∀ k : ℕ, 3 ≤ k → ∃ N : ℕ, ∀ n : ℕ, ∀ G : SimpleGraph (Fin n), (N : ℕ∞) ≤ G.chromaticNumber → HasHighChromaticOddCycle G k := by
  sorry

end Erdos640
