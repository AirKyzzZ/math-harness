import Mathlib

open Real Filter

namespace Erdos920

noncomputable def f (k n : ℕ) : ℕ :=
  sSup {(G.chromaticNumber) | (G : SimpleGraph (Fin n)) (_ : G.CliqueFree k)}

theorem erdos_920 :
    ∀ k : ℕ, k ≥ 4 → ∃ c > 0, (fun n ↦ f k n) ≫ (fun n ↦ (n : ℝ) ^ (1 - 1 / ((k : ℝ) - 1)) / (log n) ^ c) := by
  sorry

end Erdos920
