import Mathlib

namespace Erdos268

theorem erdos_268 (d : ℕ) :
    (interior {x : Fin d → ℝ | ∃ A : Set ℕ, A.Infinite ∧ Summable (fun n : A => (1 : ℝ) / n ) ∧ x = fun i : Fin d => ∑' n : A, (1 : ℝ) / (n + i)}).Nonempty := by
  sorry

end Erdos268
