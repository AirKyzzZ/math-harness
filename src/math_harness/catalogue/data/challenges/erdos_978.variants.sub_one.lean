import Mathlib

open Polynomial Set

namespace Erdos978

theorem erdos_978.variants.sub_one {f : ℤ[X]} (hi : Irreducible f) (hd : 2 < f.natDegree) (hp : ∀ (x : ℕ), f.natDegree ≠ 2 ^ x) (hlc : 0 < f.leadingCoeff) :
    {n : ℕ | Powerfree (f.natDegree - 1) (f.eval (n : ℤ))}.Infinite := by
  sorry

end Erdos978
