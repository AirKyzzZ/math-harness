import Mathlib

open Nat Set Filter

open scoped Topology

namespace Erdos341

theorem erdos_341 :
    ¬ ∀ (a : ℕ → ℕ), StrictMono a → 0 < a 0 → (∀ᶠ n in atTop, IsLeast { x | a n < x ∧ x ∉ { a i + a j | (i ≤ n) (j ≤ n) } } (a (n + 1))) → let d := fun i ↦ (a (i + 1) : ℤ) - a i ∃ p > 0, ∀ᶠ m in atTop, d (m + p) = d m := by
  sorry

end Erdos341
