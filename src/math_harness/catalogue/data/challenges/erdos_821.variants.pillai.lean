import Mathlib

open Nat Filter

namespace Erdos821

noncomputable def g (n : ℕ) : ℕ :=
  { m : ℕ | totient m = n }.ncard

theorem erdos_821.variants.pillai :
    atTop.limsup (fun n : ℕ ↦ (g n : EReal)) = ⊤ := by
  sorry

end Erdos821
