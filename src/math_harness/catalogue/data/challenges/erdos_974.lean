import Mathlib

namespace Erdos974

def IsTuranConfiguration {n : ℕ} (z : Fin n → ℂ) : Prop :=
  (Odd n → Set.range z = {ζ : ℂ | ζ ^ n = 1}) ∧
    (Even n → ∃ c : ℂ, ‖c‖ = 1 ∧ c ≠ 1 ∧
      Set.range z = {ζ : ℂ | ζ ^ (n / 2) = 1} ∪ {ζ : ℂ | ζ ^ (n / 2) = c})

theorem erdos_974 {n : ℕ} [NeZero n] (z : Fin n → ℂ) (hz : z 0 = 1) (hs : Set.Infinite {k : ℕ | ∀ j < n - 1, ∑ i, z i ^ (k + j) = 0}) :
    IsTuranConfiguration z := by
  sorry

end Erdos974
