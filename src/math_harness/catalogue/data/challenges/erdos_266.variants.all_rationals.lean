import Mathlib

namespace Erdos266

open Filter

theorem erdos_266.variants.all_rationals :
    ∃ a : ℕ → ℕ, StrictMono a ∧ a 0 ≥ 1 ∧ (∀ t : ℚ, (¬ ∃ n : ℕ, t = -(a n)) → (∃ q : ℚ, HasSum (fun n : ℕ => ((1 : ℝ) / ((a n) + t))) q)) := by
  sorry

end Erdos266
