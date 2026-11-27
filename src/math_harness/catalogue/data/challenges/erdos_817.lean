import Mathlib

open Filter

namespace Erdos817

noncomputable

def g (k : ℕ) (n : ℕ) : ℕ := sInf { N | ∃ A ⊆ Finset.Icc 1 N, A.card = n ∧
    ∀ s, s ⊆ { ∑ a ∈ B, a | B ∈ A.powerset } → s.IsAPOfLengthFree k}

-- Formalisation note : only formalising the "In particular" part

theorem erdos_817 :
    ¬ (fun n => (3 ^ n : ℝ)) =O[atTop] fun n => (g 3 n : ℝ) := by
  sorry

end Erdos817
