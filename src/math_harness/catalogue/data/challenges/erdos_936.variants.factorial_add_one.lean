import Mathlib

open Filter Nat

namespace Erdos936

def EventuallyNotPowerful (a : ℕ → ℕ) : Prop := atTop.Eventually (fun n => ¬ (a n).Powerful)

theorem erdos_936.variants.factorial_add_one :
    EventuallyNotPowerful (·! + 1) := by
  sorry

end Erdos936
