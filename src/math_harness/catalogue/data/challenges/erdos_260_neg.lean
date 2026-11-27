import Mathlib

namespace Erdos260

open Filter

theorem erdos_260_neg :
    ¬ (∀ a : ℕ → ℤ, ∀ s : ℝ, StrictMono a → Tendsto (fun n => (a n : ℝ ) / n ) atTop atTop → HasSum (fun n => (a n : ℝ ) / 2 ^ a n) s → Irrational s) := by
  sorry

-- TODO: Add a proof of the theorem under the strong assumption $a_{n+1}-a_n → \infty$

-- TODO: Add a proof of the theorem under the strong assumption $a_n \gg n\sqrt{\log{n}\log{\log{n}}}$

end Erdos260
