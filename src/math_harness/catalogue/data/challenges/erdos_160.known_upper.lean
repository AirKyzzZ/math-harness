import Mathlib

namespace Erdos160

noncomputable def erdos_160.h (n : ℕ) : ℕ :=
    sInf {k | ∃ (colouring : Finset.Icc 1 n → Fin k), ∀ (progression : Set ℕ),
    (progression ⊆ Finset.Icc 1 n ∧ progression.IsAPOfLength 4) →
    3 ≤ (colouring '' {k | (k : ℕ) ∈ progression}).ncard}

open Filter

theorem erdos_160.known_upper :
    (fun n => (erdos_160.h n : ℝ)) =O[atTop] fun n => (n : ℝ) ^ ((2 : ℝ) / 3) := by
  sorry

open Real

end Erdos160
