import Mathlib

open Filter SimpleGraph

namespace Erdos713

open scoped Classical in
theorem erdos_713.parts.i_neg :
    ¬ (∀ (q : ℕ) (G : SimpleGraph (Fin q)), G.IsBipartite → 2 ≤ G.edgeFinset.card → ∃ α c : ℝ, α ∈ Set.Ico 1 2 ∧ 0 < c ∧ Asymptotics.IsEquivalent atTop (fun n : ℕ => (extremalNumber n G : ℝ)) (fun n : ℕ => c * (n : ℝ) ^ α)) := by
  sorry

end Erdos713
