import Mathlib

namespace Erdos448

open Filter Asymptotics Topology

def tauPlus (n : ℕ) : ℕ := (n.divisors.image (Nat.log 2)).card

theorem tauPlus_six : tauPlus 6 = 3 := by decide

theorem tauPlus_twelve : tauPlus 12 = 4 := by decide

theorem tauPlus_le_tau (n : ℕ) : tauPlus n ≤ n.divisors.card :=
  Finset.card_image_le

theorem erdos_448.variants.erdos_tenenbaum :
    Tendsto (fun ε : ℝ => Real.log ({n : ℕ | (tauPlus n : ℝ) < ε * (n.divisors.card : ℝ)}.upperDensity) / Real.log ε) (𝓝[>] (0 : ℝ)) (𝓝 (1 : ℝ)) := by
  sorry

end Erdos448
