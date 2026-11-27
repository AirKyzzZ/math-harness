import Mathlib

open Filter Real

open scoped Topology

namespace Erdos1190

noncomputable def eps (m : ℕ) : ℝ :=
  sSup {s : ℝ | ∃ (S : Finset ℕ) (a : ℕ → ℤ), (∀ n ∈ S, m < n) ∧
    (∀ n ∈ S, ∀ n' ∈ S, n ≠ n' → ¬ ∃ x : ℤ, x ≡ a n [ZMOD n] ∧ x ≡ a n' [ZMOD n']) ∧
    (∑ n ∈ S, (n : ℝ)⁻¹) = s}

theorem erdos_1190.variants.lower_bound :
    ∀ ε : ℝ, 0 < ε → ∀ᶠ m : ℕ in atTop, scaleL m ^ (-1 - ε : ℝ) < eps m := by
  sorry

end Erdos1190
