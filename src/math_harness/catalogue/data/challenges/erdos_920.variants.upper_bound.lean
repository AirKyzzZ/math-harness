import Mathlib

open Real Filter

namespace Erdos920

noncomputable def f (k n : ℕ) : ℕ :=
  sSup {(G.chromaticNumber) | (G : SimpleGraph (Fin n)) (_ : G.CliqueFree k)}

theorem erdos_920.variants.upper_bound (k : ℕ) (hk : k ≥ 3) :
    (fun n ↦ f k n) ≪ (fun n ↦ ((n : ℝ) * log (log n) / log n) ^ (1 - 1 / ((k : ℝ) - 1))) := by
  sorry

end Erdos920
