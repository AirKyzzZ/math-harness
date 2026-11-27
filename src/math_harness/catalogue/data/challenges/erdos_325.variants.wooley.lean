import Mathlib

open Asymptotics Filter

namespace Erdos325

def IsSumThreePower (k n : ℕ) : Prop := ∃ a b c, a ^ k + b ^ k + c ^ k = n

noncomputable def cardIsSumThreePowerBelow (k x : ℕ) : ℕ :=
  {n ∈ Set.Iic x | IsSumThreePower k n}.ncard

theorem erdos_325.variants.wooley :
    (fun x : ℕ => (x : ℝ) ^ (0.91709477 : ℝ)) =O[atTop] (fun x => (cardIsSumThreePowerBelow 3 x : ℝ)) := by
  sorry

end Erdos325
