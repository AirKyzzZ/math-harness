import Mathlib

namespace Erdos979

def solutionSet (n k : ℕ) : Set (Multiset ℕ) :=
  {P | P.card = k ∧ (∀ p ∈ P, Nat.Prime p) ∧ n = (P.map (. ^ k)).sum}

theorem erdos_979.variants.k3 :
    Filter.limsup (fun n => (solutionSet n 3).encard) Filter.atTop = ⊤ := by
  sorry

end Erdos979
