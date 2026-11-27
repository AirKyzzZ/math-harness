import Mathlib

open Filter Asymptotics Polynomial

namespace Erdos976

noncomputable def F (f : ℤ[X]) (n : ℕ) : ℕ :=
  (∏ m ∈ Finset.Icc 1 n, f.eval (m : ℤ)).natAbs.maxPrimeFac

theorem erdos_976.variants.tenenbaum (f : ℤ[X]) (hf : Irreducible f) (hd : 2 ≤ f.natDegree) :
    ∃ c > (0 : ℝ), (fun n : ℕ ↦ (n : ℝ) * Real.exp (Real.log n ^ c)) =O[atTop] fun n ↦ (F f n : ℝ) := by
  sorry

end Erdos976
