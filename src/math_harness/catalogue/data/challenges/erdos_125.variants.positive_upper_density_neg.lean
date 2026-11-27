import Mathlib

open Nat Pointwise

namespace Erdos125

set_option quotPrecheck false

local notation "A" => { x : ℕ | (digits 3 x).toFinset ⊆ {0, 1} }

local notation "B" => { x : ℕ | (digits 4 x).toFinset ⊆ {0, 1} }

theorem erdos_125.variants.positive_upper_density_neg :
    ¬ (0 < (A + B).upperDensity) := by
  sorry

end Erdos125
