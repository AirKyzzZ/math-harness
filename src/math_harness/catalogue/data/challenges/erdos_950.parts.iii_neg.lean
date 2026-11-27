import Mathlib

open Filter

open scoped Asymptotics Nat.Prime

namespace Erdos950

noncomputable def f (n : ℕ) : ℝ :=
  ∑ p ∈ (Finset.range n).filter Prime, (1 : ℝ) / (n - p : ℝ)

theorem erdos_950.parts.iii_neg :
    ¬ (f =o[atTop] (fun n : ℕ ↦ Real.log (Real.log n))) := by
  sorry

end Erdos950
