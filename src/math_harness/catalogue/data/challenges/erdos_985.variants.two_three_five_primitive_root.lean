import Mathlib

namespace Erdos985

-- TODO: Artin conjectured that 2 is a primitive root for infinitely many primes $p$, which

-- Hooley proved assuming the Riemann hypothesis for the Dedekind zeta functions of certain Kummer

-- fields.

theorem erdos_985.variants.two_three_five_primitive_root :
    Set.Infinite {p : ℕ | p.Prime ∧ (orderOf (2 : ZMod p) = p - 1 ∨ orderOf (3 : ZMod p) = p - 1 ∨ orderOf (5 : ZMod p) = p - 1)} := by
  sorry

end Erdos985
