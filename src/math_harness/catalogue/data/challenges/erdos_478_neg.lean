import Mathlib

namespace Erdos478

theorem erdos_478_neg :
    ¬ (Filter.Tendsto (fun p : ℕ => (((Finset.Ico 1 p).image (fun k => Nat.factorial k % p)).card : ℝ) / p) (Filter.atTop ⊓ Filter.principal {p : ℕ | p.Prime}) (nhds (1 - 1 / Real.exp 1))) := by
  sorry

end Erdos478
