import Mathlib

namespace Erdos349

open Set Filter Real Nat Function

def IsGoodPair (t α : ℝ) : Prop :=
  IsAddComplete (range (fun n ↦ ⌊t * α ^ n⌋))

theorem erdos_349.variants.floor_3_halves_odd_neg :
    ¬ ({n | Odd ⌊(3/2 : ℝ) ^ n⌋}.Infinite) := by
  sorry

end Erdos349
