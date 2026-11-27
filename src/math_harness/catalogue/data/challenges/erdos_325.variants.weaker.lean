import Mathlib

open Asymptotics Filter

namespace Erdos325

def IsSumThreePower (k n : ℕ) : Prop := ∃ a b c, a ^ k + b ^ k + c ^ k = n

noncomputable def cardIsSumThreePowerBelow (k x : ℕ) : ℕ :=
  {n ∈ Set.Iic x | IsSumThreePower k n}.ncard

theorem erdos_325.variants.weaker :
    ∀ ε > 0, ∀ k : ℕ, 3 ≤ k → (fun x : ℕ => (x : ℝ) ^ ((3 / k : ℝ) - ε)) =O[atTop] (fun x => (cardIsSumThreePowerBelow k x : ℝ)) := by
  sorry

end Erdos325
