import Mathlib

open Filter Polynomial Finset

namespace Erdos283

def Condition (p : ℚ[X]) : Prop :=
  (∀ n : ℤ, ∃ z : ℤ, p.eval (n : ℚ) = z) → p.leadingCoeff > 0 →
  ¬ (∃ d : ℤ, d ≥ 2 ∧ ∀ n : ℤ, n ≥ 1 → ∃ z : ℤ, p.eval (n : ℚ) = d * z) →
  ∀ᶠ (m : ℤ) in atTop, ∃ k ≥ 1, ∃ n : Fin (k + 1) → ℤ, 0 = n 0 ∧ StrictMono n ∧
  1 = ∑ i ∈ Finset.Icc 1 (Fin.last k), (1 : ℚ) / (n i) ∧
  (m : ℚ) = ∑ i ∈ Finset.Icc 1 (Fin.last k), p.eval (n i : ℚ)

theorem erdos_283.variants.graham_alpha :
    ∀ (p : ℚ[X]) (α : ℚ), (∀ n : ℤ, ∃ z : ℤ, p.eval (n : ℚ) = z) → 0 < p.leadingCoeff → (¬ ∃ (d : ℤ), d ≥ 2 ∧ ∀ (n : ℤ), n ≥ 1 → ∃ z : ℤ, p.eval (n : ℚ) = d * z) → α > 0 → ∀ᶠ (m : ℕ) in atTop, ∃ S : Finset ℕ, (∀ n ∈ S, 1 ≤ n) ∧ (∑ n ∈ S, (1 / (n : ℚ))) = α ∧ (∑ n ∈ S, p.eval (n : ℚ)) = (m : ℚ) := by
  sorry

end Erdos283
