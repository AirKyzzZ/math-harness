import Mathlib

open Filter Set AdditiveCombinatorics

open scoped Pointwise

namespace Erdos28

theorem erdos_28 (A : Set ℕ) (h : (A + A)ᶜ.Finite) :
    limsup (fun (n : ℕ) => (sumRep A n : ℕ∞)) atTop = (⊤ : ℕ∞) := by
  sorry

-- TODO(firsching): add the theorems/conjectures for the comments on the page

end Erdos28
