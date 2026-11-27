import Mathlib

namespace Erdos1093

open Finset Nat

noncomputable def deficiency (n k : ℕ) : ℕ :=
  #{i ∈ range k | n - i ∈ smoothNumbers (k + 1)}

theorem erdos_1093.parts.ii :
    {x : ℕ × ℕ | let k := x.1; let n := x.2; 2 * k ≤ n ∧ deficiency n k > 1 ∧ ∀ p, p.Prime → (p ∣ choose n k) → k < p}.Finite := by
  sorry

end Erdos1093
