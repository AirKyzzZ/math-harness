import Mathlib

namespace Erdos32

open scoped Nat

open Filter Set Asymptotics

def IsAdditiveComplementToPrimes (A : Set ℕ) : Prop :=
  ∀ᶠ n in atTop, ∃ p, p.Prime ∧ ∃ a ∈ A, n = p + a

open scoped Classical in
theorem erdos_32 :
    ∃ A : Set ℕ, IsAdditiveComplementToPrimes A ∧ (fun N => (((Finset.Icc 1 N).filter (· ∈ A)).card : ℝ)) =o[atTop] fun N => (Real.log N) ^ 2 := by
  sorry

end Erdos32
