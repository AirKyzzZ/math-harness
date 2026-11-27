import Mathlib

open Filter

open scoped Asymptotics Nat.Prime

namespace Erdos950

noncomputable def f (n : ℕ) : ℝ :=
  ∑ p ∈ (Finset.range n).filter Prime, (1 : ℝ) / (n - p : ℝ)

theorem erdos_950.parts.ii_neg :
    ¬ (atTop.limsup (fun n : ℕ ↦ (f n : EReal)) = ⊤) := by
  sorry

end Erdos950
