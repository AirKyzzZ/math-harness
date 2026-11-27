import Mathlib

open Nat Filter Finset

open scoped ArithmeticFunction.omega

namespace Erdos891

theorem erdos_891_neg :
    ¬ (∀ k ≥ 2, ∀ᶠ n in atTop, ∃ m ∈ Ico n (n + ∏ i ∈ range k, i.nth Nat.Prime), k < ω m) := by
  sorry

end Erdos891
