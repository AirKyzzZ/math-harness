import Mathlib

open Filter ENNReal

namespace Erdos455

theorem erdos_455.variants.liminf :
    ∀ q : ℕ → ℕ, StrictMono q → (∀ n, (q n).Prime ∧ q (n + 2) - q (n + 1) ≥ q (n + 1) - q n) → liminf (fun n : ℕ => (q n : ℝ≥0∞) / n ^ 2) atTop > 0.352 := by
  sorry

end Erdos455
