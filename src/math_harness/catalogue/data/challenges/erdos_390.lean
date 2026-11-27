import Mathlib

open scoped Nat

open Filter Asymptotics Real

namespace Erdos390

noncomputable def f (n : ℕ) : ℕ := sInf {m : ℕ | ∃ k, ∃ f : ℕ → ℕ, StrictMono f ∧
  n < f 0 ∧ f (k - 1) = m ∧ ∏ i < k, f i = n !}

theorem erdos_390 :
    ∃ c, (fun n => f n - 2 * n : ℕ → ℝ) ~[atTop] (fun n => c * n / log (n : ℝ)) := by
  sorry

end Erdos390
