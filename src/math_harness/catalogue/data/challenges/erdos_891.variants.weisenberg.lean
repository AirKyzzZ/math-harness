import Mathlib

open Nat Filter Finset

open scoped ArithmeticFunction.omega

namespace Erdos891

theorem erdos_891.variants.weisenberg (k : ℕ) (hk : k ≥ 2) (hdickson : type_of% Dickson.dickson_conjecture) :
    ∃ᶠ n in atTop, ∀ m ∈ Ico n (n + (∏ i ∈ range k, i.nth Nat.Prime) - 1), ω m ≤ k := by
  sorry

end Erdos891
