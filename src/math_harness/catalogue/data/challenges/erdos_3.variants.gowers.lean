import Mathlib

open Asymptotics Filter

namespace Erdos3

noncomputable abbrev r := Set.IsAPOfLengthFree.maxCard

theorem erdos_3.variants.gowers (k : ℕ) (hk : 3 ≤ k) :
    ∃ c > (0 : ℝ), (fun N ↦ (r k N : ℝ)) ≪ fun N : ℕ ↦ (N : ℝ) * Real.log (Real.log N) ^ (-c) := by
  sorry

end Erdos3
