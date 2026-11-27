import Mathlib

open SimpleGraph

namespace Erdos577

open scoped Classical in
theorem erdos_577 (k : ℕ) (G : SimpleGraph (Fin (4 * k))) (hG : 2 * k ≤ G.minDegree) :
    ∃ cycles : Fin k → (cycleGraph 4).Copy G, Pairwise fun i j => Disjoint (Set.range (fun v => cycles i v)) (Set.range (fun v => cycles j v)) := by
  sorry

end Erdos577
