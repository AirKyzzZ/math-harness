import Mathlib

open Filter Real

open scoped Topology

namespace Erdos1190

noncomputable def eps (m : ℕ) : ℝ :=
  sSup {s : ℝ | ∃ (S : Finset ℕ) (a : ℕ → ℤ), (∀ n ∈ S, m < n) ∧
    (∀ n ∈ S, ∀ n' ∈ S, n ≠ n' → ¬ ∃ x : ℤ, x ≡ a n [ZMOD n] ∧ x ≡ a n' [ZMOD n']) ∧
    (∑ n ∈ S, (n : ℝ)⁻¹) = s}

theorem erdos_1190.variants.tendsto_zero :
    Tendsto eps atTop (𝓝 0) := by
  sorry

end Erdos1190
