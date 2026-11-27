import Mathlib

open Filter

namespace Erdos447

noncomputable def maxUnionFree (n : ℕ) : ℕ :=
  sSup { k | ∃ F : Finset (Finset (Fin n)), F.UnionFree ∧ F.card = k }

theorem erdos_447.parts.i :
    (fun n : ℕ => (maxUnionFree n : ℝ)) =o[atTop] (fun n : ℕ => (2 : ℝ) ^ n) := by
  sorry

end Erdos447
