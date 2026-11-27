import Mathlib

namespace Erdos57

theorem erdos_57 :
    ∀ {V : Type*} (G : SimpleGraph V), G.chromaticNumber = ⊤ → ¬ Summable (fun (a : G.oddCycleLengths) ↦ 1 / (a : ℝ)) := by
  sorry

-- TODO: Add variants of the problem.

end Erdos57
