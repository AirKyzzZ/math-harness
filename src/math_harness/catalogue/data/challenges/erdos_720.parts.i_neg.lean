import Mathlib

open Filter SimpleGraph

namespace Erdos720

noncomputable abbrev sizeRamseyNumber {V : Type*} [Fintype V] (G : SimpleGraph V) : ℕ :=
  sizeRamsey G G

theorem erdos_720.parts.i_neg :
    ¬ (¬ Tendsto (fun n : ℕ ↦ (sizeRamseyNumber (pathGraph (n + 1)) : ℝ) / n) atTop atTop) := by
  sorry

end Erdos720
