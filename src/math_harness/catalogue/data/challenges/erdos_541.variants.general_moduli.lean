import Mathlib

open Filter

namespace Erdos541

theorem erdos_541.variants.general_moduli (p : ℕ) (a : Fin p → ZMod p) (ha₀ : ∃ r, ∀ (S : Finset (Fin p)), S ≠ ∅ → ∑ i ∈ S, a i = 0 → S.card = r) :
    (Set.range a).ncard ≤ 2 := by
  sorry

end Erdos541
