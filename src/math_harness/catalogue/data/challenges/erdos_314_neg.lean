import Mathlib

open Filter

namespace Erdos314

noncomputable def mMin (n : ℕ) : ℕ := sInf {m | 1 ≤ harmonicBlock n m}

noncomputable def epsilon (n : ℕ) : ℝ := (harmonicBlock n (mMin n) : ℝ) - 1

theorem erdos_314_neg :
    ¬ (atTop.liminf (fun n : ℕ => (n : ℝ) ^ 2 * epsilon n) = 0) := by
  sorry

end Erdos314
