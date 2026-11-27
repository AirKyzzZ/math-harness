import Mathlib

open Real

namespace Erdos4

def Erdos4For (C : ℝ) : Prop :=
  {n : ℕ | (n + 1).nth Nat.Prime - n.nth Nat.Prime >
    C * log (log n) * log (log (log (log n))) / (log (log (log n))) ^ 2 * log n}.Infinite

theorem erdos_4_neg :
    ¬ ((∀ C > 0, Erdos4For C)) := by
  sorry

end Erdos4
