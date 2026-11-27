import Mathlib

open scoped Real

namespace Erdos295

noncomputable abbrev k (N : ℕ) : ℕ :=
  sInf {k | ∃ n : Fin k → ℕ, (∀ i, N ≤ n i) ∧ StrictMono n ∧ ∑ i, (1 / n i : ℝ) = 1}

theorem erdos_295.variants.erdos_straus :
    ∃ᵉ (C > 0) (O > 0), ∀ᶠ (N : ℕ) in Filter.atTop, (k N - (rexp 1 - 1)*N) ∈ Set.Ioc (-C) (O * N / (N : ℝ).log) := by
  sorry

end Erdos295
