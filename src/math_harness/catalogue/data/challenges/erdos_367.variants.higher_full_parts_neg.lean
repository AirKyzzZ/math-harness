import Mathlib

open Asymptotics Filter

namespace Erdos367

def B (r n : ℕ) : ℕ :=
  ∏ i ∈ n.factorization.support with r ≤ n.factorization i, i ^ n.factorization i

theorem erdos_367.variants.higher_full_parts_neg :
    ¬ (∀ r k : ℕ, 3 ≤ r → 2 ≤ k → ∃ ε : ℝ, 0 < ε ∧ atTop.limsup (fun n ↦ ((∏ m ∈ .Ico n (n + k), B r m : ℕ) / (n : ℝ) ^ (1 + ε) |>.toEReal)) = ⊤) := by
  sorry

end Erdos367
