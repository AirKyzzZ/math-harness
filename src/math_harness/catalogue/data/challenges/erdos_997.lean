import Mathlib

open Set

namespace Erdos997

def IsWellDistributed (x : ℕ → ℝ) : Prop :=
  ∀ ε > 0, ∀ᶠ k in Filter.atTop, ∀ n : ℕ,
  ∀ a b, 0 ≤ a → a ≤ b → b ≤ 1 →
    letI I := Ico a b
    let count := (Finset.Ioc n (n + k)).filter (fun m ↦ x m ∈ I)
    abs ((count.card : ℝ) - (b - a) * k) < ε * k

theorem erdos_997 :
    ∀ α : ℝ, ¬ IsWellDistributed (fun n ↦ Int.fract (α * (n.nth Nat.Prime))) := by
  sorry

end Erdos997
