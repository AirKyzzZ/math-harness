import Mathlib

open Filter

open scoped Topology

namespace Erdos377

noncomputable abbrev sumInvPrimesNotDvdCentralBinom (n : ℕ) : ℝ :=
  ∑ p ∈ Finset.Icc 1 n with p.Prime, if p ∣ n.centralBinom then 0 else (1 : ℝ) / p

theorem erdos_377.variants.limit.i (γ₀ : ℝ) (hγ₀ : γ₀ = ∑' (k : ℕ), (k + 2 : ℝ).log / 2 ^ (k + 2)) :
    Tendsto (fun (x : ℕ) => (1 : ℝ) / x * ∑ n ∈ Finset.Icc 1 x, sumInvPrimesNotDvdCentralBinom n) atTop (𝓝 γ₀) := by
  sorry

end Erdos377
