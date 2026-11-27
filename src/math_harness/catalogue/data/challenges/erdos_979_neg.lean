import Mathlib

namespace Erdos979

def solutionSet (n k : ℕ) : Set (Multiset ℕ) :=
  {P | P.card = k ∧ (∀ p ∈ P, Nat.Prime p) ∧ n = (P.map (. ^ k)).sum}

theorem erdos_979_neg :
    ¬ (∀ k ≥ 2, Filter.limsup (fun n => (solutionSet n k).encard) Filter.atTop = ⊤) := by
  sorry

end Erdos979
