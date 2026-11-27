import Mathlib

namespace Erdos985

theorem erdos_985 :
    ∀ᵉ (p : ℕ) (hp_prime : p.Prime) (hp_nontrivial : p ≠ 2), ∃ q, q.Prime ∧ q < p ∧ orderOf (q : ZMod p) = p - 1 := by
  sorry

-- TODO: Artin conjectured that 2 is a primitive root for infinitely many primes $p$, which

-- Hooley proved assuming the Riemann hypothesis for the Dedekind zeta functions of certain Kummer

-- fields.

end Erdos985
