import Mathlib

namespace Erdos851

def TwoPowAddSet (r : ℕ) := {(2 ^ k + n) | (k : ℕ) (n : ℕ) (_ : n.primeFactors.card ≤ r)}

def twoPowAddPrimeSet : Set ℕ := {(2 ^ k + p) | (k : ℕ) (p : ℕ) (_ : p.Prime)}

theorem erdos_851.variants.romanoff :
    0 < Set.lowerDensity twoPowAddPrimeSet := by
  sorry

end Erdos851
