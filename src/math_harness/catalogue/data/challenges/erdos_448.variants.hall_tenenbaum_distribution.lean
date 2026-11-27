import Mathlib

namespace Erdos448

open Filter Asymptotics Topology

def tauPlus (n : ℕ) : ℕ := (n.divisors.image (Nat.log 2)).card

theorem tauPlus_six : tauPlus 6 = 3 := by decide

theorem tauPlus_twelve : tauPlus 12 = 4 := by decide

theorem tauPlus_le_tau (n : ℕ) : tauPlus n ≤ n.divisors.card :=
  Finset.card_image_le

theorem erdos_448.variants.hall_tenenbaum_distribution :
    ∃ F : ℝ → ℝ, Monotone F ∧ Tendsto F atBot (𝓝 0) ∧ Tendsto F atTop (𝓝 1) ∧ ∀ z : ℝ, ContinuousAt F z → {n : ℕ | (tauPlus n : ℝ) / (n.divisors.card : ℝ) ≤ z}.HasDensity (F z) := by
  sorry

end Erdos448
