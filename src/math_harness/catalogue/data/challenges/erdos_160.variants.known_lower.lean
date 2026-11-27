import Mathlib

namespace Erdos160

noncomputable def erdos_160.h (n : ℕ) : ℕ :=
    sInf {k | ∃ (colouring : Finset.Icc 1 n → Fin k), ∀ (progression : Set ℕ),
    (progression ⊆ Finset.Icc 1 n ∧ progression.IsAPOfLength 4) →
    3 ≤ (colouring '' {k | (k : ℕ) ∈ progression}).ncard}

open Filter

open Real

theorem erdos_160.variants.known_lower :
    ∃ c > 0, (fun (n : ℕ) => exp (c * log (n : ℝ) ^ ((1 : ℝ) / 12))) =O[atTop] fun n => (erdos_160.h n : ℝ) := by
  sorry

end Erdos160
