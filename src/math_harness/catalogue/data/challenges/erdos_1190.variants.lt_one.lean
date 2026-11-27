import Mathlib

open Filter Real

open scoped Topology

namespace Erdos1190

noncomputable def eps (m : ℕ) : ℝ :=
  sSup {s : ℝ | ∃ (S : Finset ℕ) (a : ℕ → ℤ), (∀ n ∈ S, m < n) ∧
    (∀ n ∈ S, ∀ n' ∈ S, n ≠ n' → ¬ ∃ x : ℤ, x ≡ a n [ZMOD n] ∧ x ≡ a n' [ZMOD n']) ∧
    (∑ n ∈ S, (n : ℝ)⁻¹) = s}

theorem erdos_1190.variants.lt_one (m : ℕ) (hm : 1 ≤ m) (S : Finset ℕ) (a : ℕ → ℤ) (hS : ∀ n ∈ S, m < n) (hdisj : ∀ n ∈ S, ∀ n' ∈ S, n ≠ n' → ¬ ∃ x : ℤ, x ≡ a n [ZMOD n] ∧ x ≡ a n' [ZMOD n']) :
    (∑ n ∈ S, (n : ℝ)⁻¹) < 1 := by
  sorry

end Erdos1190
