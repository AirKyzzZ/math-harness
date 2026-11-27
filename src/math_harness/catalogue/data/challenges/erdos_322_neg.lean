import Mathlib

namespace Erdos322

def representationCount (k n : ℕ) : ℕ :=
  ((Finset.univ : Finset (Fin k → Fin (n + 1))).filter
    (fun a ↦ (∀ i, 0 < (a i : ℕ)) ∧ ∑ i, (a i : ℕ) ^ k = n)).card

theorem erdos_322_neg :
    ¬ (∀ k : ℕ, 3 ≤ k → ∃ c > (0 : ℝ), {n : ℕ | (n : ℝ) ^ c < representationCount k n}.Infinite) := by
  sorry

end Erdos322
