import Mathlib

namespace Erdos905

open Finset

theorem erdos_905 (n : ℕ) (G : SimpleGraph (Fin n)) [DecidableRel G.Adj] (hG : (n : ℝ) ^ 2 / 4 < (#G.edgeFinset : ℝ)) :
    ∃ e ∈ G.edgeFinset, (n : ℝ) / 6 ≤ (#(G.trianglesContaining e) : ℝ) := by
  sorry

end Erdos905
