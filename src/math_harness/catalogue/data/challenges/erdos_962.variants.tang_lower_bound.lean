import Mathlib

open Filter Real

namespace Erdos962

def Erdos962Prop (n k : ℕ) : Prop :=
  ∃ m ≤ n, ∀ i ∈ Set.Icc 1 k,
    ∃ p : ℕ, Nat.Prime p ∧ k < p ∧ p ∣ (m + i)

noncomputable def k (n : ℕ) : ℕ :=
  open scoped Classical in
  Nat.findGreatest (fun k => Erdos962Prop n k) n

theorem erdos_962.variants.tang_lower_bound :
    ∃ ε : ℕ → ℝ, (∀ δ > 0, ∀ᶠ n in atTop, |ε n| < δ) ∧ ∀ᶠ n : ℕ in atTop, (1 / sqrt 2 - ε n) * sqrt (log n * log (log n)) ≤ log (k n : ℝ) := by
  sorry

end Erdos962
