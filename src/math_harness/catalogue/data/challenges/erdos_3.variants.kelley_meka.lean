import Mathlib

open Asymptotics Filter

namespace Erdos3

noncomputable abbrev r := Set.IsAPOfLengthFree.maxCard

theorem erdos_3.variants.kelley_meka :
    ∃ β > (0 : ℝ), ∃ c > (0 : ℝ), (fun N ↦ (r 3 N : ℝ)) ≪ fun N : ℕ ↦ (N : ℝ) * Real.exp (-c * Real.log N ^ β) := by
  sorry

end Erdos3
