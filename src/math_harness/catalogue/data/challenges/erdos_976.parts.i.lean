import Mathlib

open Filter Asymptotics Polynomial

namespace Erdos976

noncomputable def F (f : ℤ[X]) (n : ℕ) : ℕ :=
  (∏ m ∈ Finset.Icc 1 n, f.eval (m : ℤ)).natAbs.maxPrimeFac

theorem erdos_976.parts.i :
    ∀ f : ℤ[X], Irreducible f → 2 ≤ f.natDegree → ∃ c > (0 : ℝ), (fun n : ℕ ↦ (n : ℝ) ^ (1 + c)) =O[atTop] fun n ↦ (F f n : ℝ) := by
  sorry

end Erdos976
