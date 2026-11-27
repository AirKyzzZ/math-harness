import Mathlib

open Filter

open scoped Asymptotics Nat.Prime

namespace Erdos950

noncomputable def f (n : ℕ) : ℝ :=
  ∑ p ∈ (Finset.range n).filter Prime, (1 : ℝ) / (n - p : ℝ)

theorem erdos_950.parts.i_neg :
    ¬ (atTop.liminf (fun n : ℕ ↦ (f n : EReal)) = 1) := by
  sorry

end Erdos950
