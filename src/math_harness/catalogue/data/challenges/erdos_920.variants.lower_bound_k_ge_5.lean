import Mathlib

open Real Filter

namespace Erdos920

noncomputable def f (k n : ℕ) : ℕ :=
  sSup {(G.chromaticNumber) | (G : SimpleGraph (Fin n)) (_ : G.CliqueFree k)}

theorem erdos_920.variants.lower_bound_k_ge_5 (k : ℕ) (hk : k ≥ 5) :
    ∃ c > 0, (fun n ↦ f k n) ≫ (fun (n : ℕ) ↦ (n : ℝ) ^ (1 - 1 / ((k : ℝ) - 1)) / (log n) ^ c) := by
  sorry

end Erdos920
