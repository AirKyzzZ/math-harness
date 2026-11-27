import Mathlib

open Nat Pointwise

namespace Erdos125

set_option quotPrecheck false

local notation "A" => { x : ℕ | (digits 3 x).toFinset ⊆ {0, 1} }

local notation "B" => { x : ℕ | (digits 4 x).toFinset ⊆ {0, 1} }

theorem erdos_125.variants.positive_unequal_density :
    ¬ (0 < (A + B).lowerDensity ∧ (A + B).lowerDensity < (A + B).upperDensity) := by
  sorry

end Erdos125
