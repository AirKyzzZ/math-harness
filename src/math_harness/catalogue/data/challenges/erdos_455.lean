import Mathlib

open Filter ENNReal

namespace Erdos455

theorem erdos_455 :
    ∀ q : ℕ → ℕ, StrictMono q → (∀ n, (q n).Prime ∧ q (n + 2) - q (n + 1) ≥ q (n + 1) - q n) → Tendsto (fun n : ℕ => (q n : ℝ) / n ^ 2) atTop atTop := by
  sorry

end Erdos455
