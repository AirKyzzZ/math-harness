import Mathlib

open Nat

namespace Erdos1056

def AllModProdEqualsOne (p : ℕ) {k : ℕ} (boundaries : Fin (k + 1) → ℕ) : Prop :=
  ∀ i : Fin k,
    (∏ n ∈ Finset.Ico (boundaries i.castSucc) (boundaries (i.castSucc + 1)), n) ≡ 1 [MOD p]

theorem erdos_1056_neg :
    ¬ (∀ k ≥ 2, ∃ (p : ℕ) (_ : p.Prime) (boundaries : Fin (k + 1) → ℕ) (_ : StrictMono boundaries), AllModProdEqualsOne p boundaries) := by
  sorry

theorem erdos_1056.variants.k2 :
    AllModProdEqualsOne 11 ![3, 5, 8] := by
  unfold AllModProdEqualsOne
  decide

theorem erdos_1056.variants.k3 :
    AllModProdEqualsOne 17 ![2, 6, 12, 16] := by
  unfold AllModProdEqualsOne
  decide

end Erdos1056
