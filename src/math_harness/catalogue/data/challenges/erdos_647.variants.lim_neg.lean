import Mathlib

namespace Erdos647

open Filter ArithmeticFunction.sigma

theorem erdos_647.variants.twenty_four : ⨆ m : Fin 24, (m : ℕ) + σ 0 m ≤ 26 := by
  exact ciSup_le <| by decide

theorem erdos_647.variants.lim_neg :
    ¬ (atTop.Tendsto (fun n ↦ ⨆ m : Fin n, σ 0 m + m - n) atTop) := by
  sorry

end Erdos647
