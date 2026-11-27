import Mathlib

open Nat Pointwise

namespace Erdos125

set_option quotPrecheck false

local notation "A" => { x : ℕ | (digits 3 x).toFinset ⊆ {0, 1} }

local notation "B" => { x : ℕ | (digits 4 x).toFinset ⊆ {0, 1} }

theorem erdos_125.variants.zero_density :
    (A + B).upperDensity = 0 ∧ (A + B).lowerDensity = 0 := by
  sorry

end Erdos125
