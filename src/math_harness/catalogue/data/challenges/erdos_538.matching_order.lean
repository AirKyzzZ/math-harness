import Mathlib

open Asymptotics Filter

namespace Erdos538

open scoped Classical in
def representations (A : Finset ℕ) (m : ℕ) : Finset (ℕ × ℕ) :=
  (Finset.range (m + 1) ×ˢ A).filter (fun pa => Nat.Prime pa.1 ∧ m = pa.1 * pa.2)

def Admissible (r N : ℕ) (A : Finset ℕ) : Prop :=
  (∀ a ∈ A, 1 ≤ a ∧ a ≤ N) ∧ ∀ m : ℕ, (representations A m).card ≤ r

def reciprocalMass (A : Finset ℕ) : ℚ := ∑ a ∈ A, (1 : ℚ) / a

noncomputable def maxMass (r N : ℕ) : ℝ :=
  sSup ((fun A => (reciprocalMass A : ℝ)) '' {A : Finset ℕ | Admissible r N A})

theorem erdos_538.matching_order (r N : ℕ) (hr : 2 ≤ r) (hN : 2 ≤ N) :
    (∀ A : Finset ℕ, Admissible r N A → Real.log (Real.log (N + 1)) * (reciprocalMass A : ℝ) ≤ 2 * r * (1 + Real.log (N * N))) ∧ (∃ A : Finset ℕ, Admissible r N A ∧ Real.log (N + 1) ≤ 4 + (8192 * (Nat.log 2 (Nat.log 2 N) + 1) : ℝ) * (reciprocalMass A : ℝ)) := by
  sorry

end Erdos538
