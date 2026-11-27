import Mathlib

open Real Filter

namespace Erdos920

noncomputable def f (k n : ℕ) : ℕ :=
  sSup {(G.chromaticNumber) | (G : SimpleGraph (Fin n)) (_ : G.CliqueFree k)}

theorem erdos_920.variants.lower_bound_k_eq_4 :
    (fun n ↦ f 4 n) ≫ (fun n ↦ (n : ℝ) ^ (2 / 3 : ℝ) / (log n) ^ (4 / 3 : ℝ)) := by
  sorry

end Erdos920
