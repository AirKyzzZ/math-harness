import Mathlib

namespace Erdos647

open Filter ArithmeticFunction.sigma

theorem erdos_647.variants.twenty_four : ⨆ m : Fin 24, (m : ℕ) + σ 0 m ≤ 26 := by
  exact ciSup_le <| by decide

theorem erdos_647.variants.infinite :
    ∀ k, { n | ⨆ m : Set.Ioo (n - k) n, ↑m + σ 0 m ≤ n + 2 }.Infinite := by
  sorry

end Erdos647
