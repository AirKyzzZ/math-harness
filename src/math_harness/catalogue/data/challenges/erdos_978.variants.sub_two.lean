import Mathlib

open Polynomial Set

namespace Erdos978

theorem erdos_978.variants.sub_two {f : ℤ[X]} (hi : Irreducible f) (hd : 9 ≤ f.natDegree) (hp : ∀ (p : ℕ), p.Prime → ∃ n : ℕ, ¬ (p : ℤ) ^ (f.natDegree - 2) ∣ f.eval (n : ℤ)) :
    {n : ℕ | Powerfree (f.natDegree - 2) (f.eval (n : ℤ))}.Infinite := by
  sorry

end Erdos978
