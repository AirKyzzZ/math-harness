import Mathlib

namespace Erdos448

open Filter Asymptotics Topology

def tauPlus (n : ℕ) : ℕ := (n.divisors.image (Nat.log 2)).card

theorem tauPlus_six : tauPlus 6 = 3 := by decide

theorem tauPlus_twelve : tauPlus 12 = 4 := by decide

theorem tauPlus_le_tau (n : ℕ) : tauPlus n ≤ n.divisors.card :=
  Finset.card_image_le

theorem erdos_448.variants.hall_tenenbaum_upper_bound :
    (fun ε : ℝ => ({n : ℕ | (tauPlus n : ℝ) < ε * (n.divisors.card : ℝ)}).upperDensity) =O[𝓝[>] (0 : ℝ)] (fun ε : ℝ => ε * Real.log (2 / ε)) := by
  sorry

end Erdos448
