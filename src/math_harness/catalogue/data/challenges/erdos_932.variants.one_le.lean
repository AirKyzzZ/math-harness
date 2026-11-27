import Mathlib

namespace Erdos932

theorem erdos_932.variants.one_le :
    { r : ℕ | 1 ≤ (Finset.Ioo (r.nth Nat.Prime) (r.succ.nth Nat.Prime) |>.filter (fun m => m.maxPrimeFac < r.succ.nth Nat.Prime - r.nth Nat.Prime)).card }.HasDensity 0 := by
  sorry

end Erdos932
