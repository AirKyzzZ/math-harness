import Mathlib

namespace Erdos647

open Filter ArithmeticFunction.sigma

theorem erdos_647_neg :
    ¬ (∃ n > 24, ⨆ m : Fin n, m + σ 0 m ≤ n + 2) := by
  sorry

theorem erdos_647.variants.twenty_four : ⨆ m : Fin 24, (m : ℕ) + σ 0 m ≤ 26 := by
  exact ciSup_le <| by decide

end Erdos647
