import Mathlib

namespace Erdos448

open Filter Asymptotics Topology

def tauPlus (n : ℕ) : ℕ := (n.divisors.image (Nat.log 2)).card

theorem tauPlus_six : tauPlus 6 = 3 := by decide

theorem tauPlus_twelve : tauPlus 12 = 4 := by decide

theorem tauPlus_le_tau (n : ℕ) : tauPlus n ≤ n.divisors.card :=
  Finset.card_image_le

theorem erdos_448_neg :
    ¬ (¬ ∀ ε : ℝ, 0 < ε → {n : ℕ | (tauPlus n : ℝ) < ε * (n.divisors.card : ℝ)}.HasDensity 1) := by
  sorry

end Erdos448
