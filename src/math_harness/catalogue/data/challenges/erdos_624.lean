import Mathlib

namespace Erdos624

open Filter Finset

def ExistsEventuallySurjective (n m : ℕ) : Prop :=
  ∃ (f : Finset (Fin n) → Fin n),
    ∀ (Y : Finset (Fin n)), #Y ≥ m →
      Y.powerset.image f = Finset.univ

noncomputable def H (n : ℕ) : ℕ :=
  if 0 < n then
    sInf {m : ℕ | ExistsEventuallySurjective n m}
  else 0

theorem erdos_624 :
    atTop.Tendsto (fun n : ℕ => H n - Real.logb 2 (n : ℝ)) atTop := by
  sorry

end Erdos624
