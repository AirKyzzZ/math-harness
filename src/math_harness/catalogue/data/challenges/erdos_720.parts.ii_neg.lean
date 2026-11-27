import Mathlib

open Filter SimpleGraph

namespace Erdos720

noncomputable abbrev sizeRamseyNumber {V : Type*} [Fintype V] (G : SimpleGraph V) : ℕ :=
  sizeRamsey G G

theorem erdos_720.parts.ii_neg :
    ¬ (Tendsto (fun n : ℕ ↦ (sizeRamseyNumber (pathGraph (n + 1)) : ℝ) / (n : ℝ) ^ 2) atTop (nhds 0)) := by
  sorry

end Erdos720
