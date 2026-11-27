import Mathlib

open Set

namespace Erdos997

def IsWellDistributed (x : ℕ → ℝ) : Prop :=
  ∀ ε > 0, ∀ᶠ k in Filter.atTop, ∀ n : ℕ,
  ∀ a b, 0 ≤ a → a ≤ b → b ≤ 1 →
    letI I := Ico a b
    let count := (Finset.Ioc n (n + k)).filter (fun m ↦ x m ∈ I)
    abs ((count.card : ℝ) - (b - a) * k) < ε * k

theorem erdos_997.variants.lacunary (n : ℕ → ℕ) (h : IsLacunary n) :
    ∀ᵐ α, ¬ IsWellDistributed (fun k ↦ Int.fract (α * (n k : ℝ))) := by
  sorry

end Erdos997
