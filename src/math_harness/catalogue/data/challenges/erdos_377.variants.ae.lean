import Mathlib

open Filter

open scoped Topology

namespace Erdos377

noncomputable abbrev sumInvPrimesNotDvdCentralBinom (n : ℕ) : ℝ :=
  ∑ p ∈ Finset.Icc 1 n with p.Prime, if p ∣ n.centralBinom then 0 else (1 : ℝ) / p

theorem erdos_377.variants.ae (γ₀ : ℝ) (hγ₀ : γ₀ = ∑' (k : ℕ), (k + 2 : ℝ).log / 2 ^ (k + 2)) :
    ∀ ε > (0 : ℝ), {n : ℕ | |sumInvPrimesNotDvdCentralBinom n - γ₀| < ε}.HasDensity 1 := by
  sorry

end Erdos377
