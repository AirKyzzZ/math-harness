import Mathlib

open scoped Cardinal

namespace Erdos740

def NoShortOddCycle {V : Type*} (G : SimpleGraph V) (r : ℕ) : Prop :=
  ∀ (v : V) (c : G.Walk v v), c.IsCycle → Odd c.length → c.length > r

theorem erdos_740 :
    ∀ (V : Type*) (G : SimpleGraph V), ℵ₀ ≤ G.chromaticCardinal → ∀ (r : ℕ), ∃ (H : G.Subgraph), H.coe.chromaticCardinal = G.chromaticCardinal ∧ NoShortOddCycle H.coe r := by
  sorry

-- TODO: add the related infinitary chromatic-number statements from erdosproblems.com.

end Erdos740
