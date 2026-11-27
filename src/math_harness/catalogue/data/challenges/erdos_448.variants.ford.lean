import Mathlib

namespace Erdos448

open Filter Asymptotics Topology

def tauPlus (n : ℕ) : ℕ := (n.divisors.image (Nat.log 2)).card

theorem tauPlus_six : tauPlus 6 = 3 := by decide

theorem tauPlus_twelve : tauPlus 12 = 4 := by decide

theorem tauPlus_le_tau (n : ℕ) : tauPlus n ≤ n.divisors.card :=
  Finset.card_image_le

theorem erdos_448.variants.ford :
    (fun x : ℕ => ∑ n ∈ Finset.Icc 1 x, (tauPlus n : ℝ)) =Θ[atTop] (fun x : ℕ => let α : ℝ := 1 - (1 + Real.log (Real.log 2)) / Real.log 2 (x : ℝ) * Real.log (x : ℝ) ^ (1 - α) / Real.log (Real.log (x : ℝ)) ^ ((3 : ℝ) / 2)) := by
  sorry

end Erdos448
