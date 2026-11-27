import Mathlib

open scoped Real

namespace Erdos295

noncomputable abbrev k (N : ℕ) : ℕ :=
  sInf {k | ∃ n : Fin k → ℕ, (∀ i, N ≤ n i) ∧ StrictMono n ∧ ∑ i, (1 / n i : ℝ) = 1}

theorem erdos_295 :
    Filter.atTop.Tendsto (fun N => k N - (rexp 1 - 1)*N) Filter.atTop := by
  sorry

end Erdos295
