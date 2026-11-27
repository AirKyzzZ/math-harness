import Mathlib

open Asymptotics Filter

namespace Erdos142

noncomputable abbrev r := Set.IsAPOfLengthFree.maxCard

theorem erdos_142.variants.lower (k : ℕ) (hk : 1 < k) :
    (fun N => (r k N : ℝ)) =o[atTop] (fun N : ℕ => N / (N : ℝ).log) := by
  sorry

-- TODO(firsching): at known upper bounds for small k

end Erdos142
