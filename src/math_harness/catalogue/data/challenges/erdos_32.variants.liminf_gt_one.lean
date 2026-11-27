import Mathlib

namespace Erdos32

open scoped Nat

open Filter Set Asymptotics

def IsAdditiveComplementToPrimes (A : Set ℕ) : Prop :=
  ∀ᶠ n in atTop, ∃ p, p.Prime ∧ ∃ a ∈ A, n = p + a

open scoped Classical in
theorem erdos_32.variants.liminf_gt_one :
    ∀ A : Set ℕ, IsAdditiveComplementToPrimes A → (1 : EReal) < liminf (fun N => (((Finset.Icc 1 N).filter (· ∈ A)).card / Real.log N : EReal)) atTop := by
  sorry

end Erdos32
