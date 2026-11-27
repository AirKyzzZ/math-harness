import Mathlib

open Asymptotics Filter

namespace Erdos3

noncomputable abbrev r := Set.IsAPOfLengthFree.maxCard

theorem erdos_3.variants.leng_sah_sawhney (k : ℕ) (hk : 5 ≤ k) :
    ∃ c > (0 : ℝ), (fun N ↦ (r k N : ℝ)) ≪ fun N : ℕ ↦ (N : ℝ) * Real.exp (-Real.log (Real.log N) ^ c) := by
  sorry

end Erdos3
