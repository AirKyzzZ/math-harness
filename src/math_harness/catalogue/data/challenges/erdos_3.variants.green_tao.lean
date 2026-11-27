import Mathlib

open Asymptotics Filter

namespace Erdos3

noncomputable abbrev r := Set.IsAPOfLengthFree.maxCard

theorem erdos_3.variants.green_tao :
    ∃ c > (0 : ℝ), (fun N ↦ (r 4 N : ℝ)) ≪ fun N : ℕ ↦ (N : ℝ) * Real.log N ^ (-c) := by
  sorry

end Erdos3
